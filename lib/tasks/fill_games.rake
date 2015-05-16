namespace :fill_games do
  desc "Fill all games of the first park full"
  task full: :environment do
  end

  desc "Fill all games of the first park with a mix of participants"
  task mixed: :environment do
    # player_count = rand 6
    # court = Park.first.courts.first
    # gameTime = Time.zone.now.beginning_of_hour.change(hour: 17))
    # for i in 17...19 do
    #   Game.new(time: gameTime, court: court)

  end

end
