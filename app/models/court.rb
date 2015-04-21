class Court < ActiveRecord::Base
  belongs_to :park
  has_many :games
  validates :park_id, presence: true
  validates :img, presence: true

  def games_for_today
    games.where("DATE(time) = DATE(?)", Time.zone.now)
  end
end
