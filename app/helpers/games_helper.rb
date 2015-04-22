module GamesHelper
  def game_slots(games, court)
    interval = 20 # minutes

    slots = case Date.today.wday
    when 1
      create_slots 17, 19, interval
    when 3
      create_slots 17, 19, interval
    when 6
      create_slots 9, 12, interval
    when 2
      create_slots 17, 19, interval
    when 4
      create_slots 17, 19, interval
    when 5
      create_slots 17, 19, interval
    when 7
      create_slots 17, 19, interval
    else
      -1
    end

    gameTime = Time.zone.now.beginning_of_hour.change(hour: ([6,7].include?(Date.today.wday) ? 9 : 17))

    allTimes = []
    gameIndex = 0
    increment = interval.minutes

    slots.times do
      if (games[gameIndex] == nil) || (games[gameIndex].time != gameTime)
        allTimes << Game.new(court_id: court.id, time: gameTime)
      else
        allTimes << games[gameIndex]
        gameIndex += 1
      end

      gameTime += increment
    end

    allTimes
  end

  private

    def create_slots startTime, endTime, interval
      ((endTime - startTime) * 60 ) / interval
    end
end
