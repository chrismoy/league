class Court < ActiveRecord::Base
  belongs_to :park
  has_many :games
  validates :park_id, presence: true
  validates :img, presence: true

  def generate_games gameDay, interval
    time = gameDay.change(hour: 17, min: 0)
    while time.hour < 19 do
      game = Game.create(court_id: self.id, time: time)
      self.games << game
      time += interval
    end
  end
end
