# Add opening/closing time, and interval w/ default to model

module GamesHelper

  def game_slots(games, court)
    park = court.park
    interval = park.game_length # minutes

    slots = create_slots park.opening_time, park.closing_time, park.game_length

    gameTime = Time.zone.now.beginning_of_hour.change(hour: park.opening_time)

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
