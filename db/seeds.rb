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
  username = "example-#{n+1}"
  email = "#{username}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               image: "#{username}.jpg")
end

puts "#{User.count} Users in to the database (should be 11)"

# Add popular Chicago Parks

park_list = [
  # ["West Loop Athletic Club", "1380 W. Randolph Street, Chicago, IL 60607"],
  # ["Lincoln Park Athletic Club", "1019 W. Diversey Parkway, Chicago, IL 60614"],
  # ["Evanston Athletic Club", "1723 Benson Avenue, Evanston, IL 60201"]
  ["Lake Shore Park", "808 N. Lake Shore Drive, Chicago, IL 60611"],
  ["Lincoln Park", "2045 Lincoln Park W. Chicago, IL 60610"],
  # ["Horner Park", "2741 W. Montrose Avenue, Chicago, IL 60686"],
  # ["California Park", "3845 N. California Avenue, Chicago, IL 60686"],
  # ["Humboldt Park", "1400 N. Sacramento Avenue, Chicago, IL 60622"],
  ["Seward Park", "375 W. Elm Street, Chicago, IL 60686"],
  ["Oz Park", "2021 N. Burling Street, Chicago IL, 60614"],
  # ["Foster Beach", "5200 N. Lake Shore Drive, Chicago, IL 60640"],
  # ["Jackson Park", "6401 S. Stony Island Avenue, Chicago, IL 60637"],
  # ["Margaret Hie Ding Lin Park", "1735 S. State Street, Chicago, IL 60616"],
  ["Wicker Park", "1425 N. Damen Avenue, Chicago, IL 60622"]
  # ["Gompers Park", "4222 W. Foster Avenue, Chicago, IL 60630"]
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
  park.opening_time = 6
  park.closing_time = 23
  park.game_length = 20
  park.save!
  courts += 1
end

puts "#{parks} Parks added to the database"
puts "#{courts} Courts added to the database"

#############################################################################
#############################################################################
################################### END #####################################
#############################################################################
#############################################################################









