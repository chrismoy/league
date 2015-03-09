# Create Sample Users

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now,
             image: "brianScalabrine.jpeg")

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               image: "brianScalabrine.jpeg")
end

puts "#{User.count} Users in to the database (should be 11)"

# Add popular Chicago Parks

park_list = [
  ["Lake Shore Park", "808 N. Lake Shore Drive, Chicago, IL 60611"],
  ["Lincoln Park", "2045 Lincoln Park W. Chicago, IL 60610"],
  ["Horner Park", "2741 W. Montrose Avenue, Chicago, IL 60686"],
  ["California Park", "3845 N. California Avenue, Chicago, IL 60686"],
  ["Humboldt Park", "1400 N. Sacramento Avenue, Chicago, IL 60622"],
  ["Seward Park", "375 W. Elm Street, Chicago, IL 60686"],
  ["Oz Park", "2021 N. Burling Street, Chicago IL, 60614"],
  ["Foster Beach", "5200 N. Lake Shore Drive, Chicago, IL 60640"],
  ["Jackson Park", "6401 S. Stony Island Avenue, Chicago, IL 60637"],
  ["Margaret Hie Ding Lin Park", "1735 S. State Street, Chicago, IL 60616"],
  ["Wicker Park", "1425 N. Damen Avenue, Chicago, IL 60622"],
  ["Gompers Park", "4222 W. Foster Avenue, Chicago, IL 60630"]
]

# Add one court to each park

parks = courts = 0

park_list.each do |name, address|
  park = Park.create!(name: name, address: address, court_count: 0)
  parks += 1
  court = park.courts.create!(img: "HOLDER",
                              court_number: park.court_count)
  park.court_count += 1
  park.img = "#{name.camelize(:lower).gsub(' ', '')}.jpg"
  park.save!
  courts += 1
end

puts "#{parks} Parks added to the database"
puts "#{courts} Courts added to the database"

# Initialize games and users at the first park in the db

p = Park.first
p.create_daily_games(DateTime.now)
games = p.daily_games
users = User.order(:created_at).take(6)

games.each do |game|
  users.each do |user|
    game.users << user
  end
end


#############################################################################
#############################################################################
################################### END #####################################
#############################################################################
#############################################################################


# 4.times do |n|
#   name = "Park#{n}"
#   address = "#{n} State Street"
#   Park.create!(name: name,
#                address: address)
# end

# 9.times do |n|
#   park_id = (n / 3) + 1
#   img = "Image #{n}"
#   Court.create!(park_id: park_id,
#                 img: img)
# end

# users = User.order(:created_at).take(6)
# 50.times do
#   court = rand(1..9)
#   time = Faker::Time.between(7.days.ago, 12.hours.from_now, :day)
#   users.each { |user| user.games.create!(court_id: court, time: time)}
# end









