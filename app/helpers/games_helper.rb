module GamesHelper
  def game_slots(games)
    time = 20 # minutes

    nslots = case Date.today.wday
    when 1
      slots 19, 17, time
    when 3
      slots 19, 17, time
    when 6
      slots 12, 9, time
    else
      -1
    end

    nslots.times.map do |slot|

    end
  end

  private

    def slots startTime, endTime, interval
      ((endTime - startTime) * 60 ) / interval
    end
end
