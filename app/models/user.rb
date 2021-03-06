class User < ActiveRecord::Base
  has_and_belongs_to_many :games
  has_many :messages, dependent: :destroy
  has_many :social_accounts, dependent: :destroy
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_email
  before_create :create_activation_digest
  validates :name,    presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # Allows signup with no email
  # format: { with: VALID_EMAIL_REGEX },
  validates :email,  presence: true, format: { with: VALID_EMAIL_REGEX },
                                      length: { maximum: 255 },
                                      uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ?
            BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Allows for persistent ssessions for users in the database
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if given token matches its digest
  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest) == token
  end

  # Forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Activate an account
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  # Send activation email
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sets password reset attributes
  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest: User.digest(reset_token),
                    reset_sent_at: Time.zone.now)
  end

  # Sends password reset email
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if password reset is expired
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # Returns user's image if populated, else placeholder
  def image_or_placeholder
    self.image.nil? ? "missing.jpg" : self.image
  end

  # Searches for a user and creates user if they don't exist
  def User.find_or_create_from_auth_hash(auth_hash)
    user = User.find_or_create_by!(provider: auth_hash.provider, uid: auth_hash.uid, secret: auth_hash.credentials.secret) do |u|
      u.name = auth_hash.info.name
      if auth_hash.provider == 'twitter'
        u.email = "socialuser#{new_token}@gotnext.io"
      else
        u.email = auth_hash.info.email
      end
      u.password = digest(new_token)
      u.provider = auth_hash.provider
      u.uid = auth_hash.uid
      u.image = auth_hash.info.image
      u.token = auth_hash.credentials.token
      u.secret = auth_hash.credentials.secret
    end
  end

  # Returns a dummy user
  def User.empty_user
    User.new(
      name: "Open Spot",
      image: "missing.jpg",
      email: "emptyuser#{new_token}@gotnext.io",
      password: digest(new_token))
  end

  def games_today
    self.games.where(time: Time.zone.now.all_day)
  end

  def organization
    Organization.find_by(id: organization_id)
  end

  private

    # Converts email to all lower case
    def downcase_email
      email.downcase!
    end

    # Creates and activation token and digest for new user
    def create_activation_digest
      self.activation_token   = User.new_token
      self.activation_digest  = User.digest(activation_token)
    end
end
