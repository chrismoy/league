class SocialAccount < ActiveRecord::Base
  belongs_to :user

  def SocialAccount.find_or_create_from_auth_hash(auth_hash)
    social = current_user.social_accounts.where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create do |s|
      s.user_id = current_user.id
      s.provider = auth_hash.provider
      s.uid = auth_hash.uid
    end
    social.update_attributes(token: auth_hash.credentials.token, secret: auth_hash.credentials.secret, expires_at: auth_hash.credentials.expires_at)
  end
end
