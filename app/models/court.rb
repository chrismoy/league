class Court < ActiveRecord::Base
  belongs_to :park
  has_many :games
  validates :park_id, presence: true
  validates :img, presence: true

  def games_for_today
    games.where(time: Time.now.all_day)
  end
end
