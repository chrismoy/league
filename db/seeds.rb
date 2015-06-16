# Create Sample Users

# User.create!(name:  "Example User",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              admin: true,
#              activated: true,
#              activated_at: Time.zone.now,
#              image: "brianScalabrine.jpeg")

# 10.times do |n|
#   name  = Faker::Name.name
#   username = "example-#{n+1}"
#   email = "#{username}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now,
#                image: "#{username}.jpg")
# end

# puts "#{User.count} Users in to the database (should be 11)"

# Add popular Chicago Parks

cpd_list = [
  # ["Horner Park", "2741 W. Montrose Avenue, Chicago, IL 60686"],
  # ["California Park", "3845 N. California Avenue, Chicago, IL 60686"],
  # ["Humboldt Park", "1400 N. Sacramento Avenue, Chicago, IL 60622"],
  # ["Wicker Park", "1425 N. Damen Avenue, Chicago, IL 60622"],
  # ["Lake Shore Park", "808 N. Lake Shore Drive, Chicago, IL 60611"],
  # ["Lincoln Park", "2045 Lincoln Park W. Chicago, IL 60610"],
  # ["Oz Park", "2021 N. Burling Street, Chicago IL, 60614"],
  ["Seward Park", "375 W. Elm Street, Chicago, IL 60686"]
]

cac_list = [
  ["West Loop Athletic Club", "1380 W. Randolph Street, Chicago, IL 60607"],
  ["Lincoln Park Athletic Club", "1019 W. Diversey Parkway, Chicago, IL 60614"],
  ["Evanston Athletic Club", "1723 Benson Avenue, Evanston, IL 60201"]
]

ffc_list = [
  ["Gold Coast Health Club", "1030 N. Clark Street, Chicago, 60610"],
  ["Union Station Health Club", "444 W. Jackson Boulevard, Chicago, 60606"],
  ["Oak Park Health Club", "1114 Lake Street, Oak Park, IL 60301"]
]

lsf_list = [
  ["LSF Lincoln Park", "1320 W Fullerton Avenue, Chicago, IL 60614"],
  ["LSF Illinois Center", "211 North Stetson, Chicago, IL 60601"]
]

organization_list = [
  ["Chicago Park District", cpd_list],
  ["Chicago Athletic Clubs", cac_list],
  ["Formula Fitness Clubs", ffc_list],
  ["Lakeshore Sport & Fitness", lsf_list]
]

# Add one court to each park

organizations = parks = courts = 0

organization_list.each do |organization_name, park_list|
  organization = Organization.create!(name: organization_name)
  organizations += 1
  park_list.each do |name, address|
    park = Park.create!(name: name,
                        address: address,
                        court_count: 0,
                        organization_id: organization.id)
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
end

puts "#{organizations} Organizations added to the database"
puts "#{parks} Parks added to the database"
puts "#{courts} Courts added to the database"

#############################################################################
#############################################################################
################################### END #####################################
#############################################################################
#############################################################################









