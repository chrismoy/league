namespace :scheduler do
  desc "Generate games at set intervals on game days"
  task generate_games: :environment, do
    puts 'Generating games...'
    gameDay = Time.now
    interval = 20.min
    @parks = Park.all
    @parks.each do |park|
      park.court.first.generate_games(gameDay, interval)
    end
    puts 'Games generated.'
  end

end
