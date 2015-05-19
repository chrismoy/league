namespace :fill_games do
  desc "Fill all games of the first park full"
  task full: :environment do
  end

  desc "Fill all games of the first park with a mix of participants"
  task mixed: :environment do
    Court.all.each do |court|
      @park = court.park
      gameTime = Time.zone.now.beginning_of_hour.change(hour: @park.opening_time)
      increment = @park.game_length.minutes
      for time in @park.opening_time...@park.closing_time do
        game = Game.create!(time: gameTime, court: court)
        player_count = rand 6
          player_count.times do
            user = User.find_by(email: "example-#{(rand 10) + 1}@railstutorial.org")
            unless game.users.include?(user)
              game.users << user
            end
          end
        gameTime += increment
      end
    end
  end

end
