class Park < ActiveRecord::Base
  has_many :courts, dependent: :destroy
  has_many :games, through: :courts
  validates :name, presence: true
  validates :address, presence: true

  def games_today?
    daily_games.empty? ? false : true
  end

  def create_daily_games(time)
    new_games = []
    8.upto(20) do |hour|
      (0..45).step(15) do |minutes|
        courts.each do |court|
          time = time.change(hour: hour, min: minutes)
          new_games.push(Game.new(court: court, time: time))
        end
      end
    end
    new_games.each(&:save!)
  end

  def daily_games
    games = Game.where(court: self.courts, time: today_range)
  end

  private

    def today_range
      today = DateTime.now.at_beginning_of_day..DateTime.now.at_end_of_day
    end
end
