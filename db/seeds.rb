# User.create!(name: "Tuan Anh Tran Nguyen",
#   email: "anhtnt09@gmail.com",
#   password: "foobar",
#   is_admin: true)

# 99.times do |n|
#   name = Faker::Lorem.word
#   description = Faker::Lorem.sentence(3, true, 4)
#   Category.create!(name: name, description: description)
# end

# 99.times do |n|
#   name = Faker::Name.name_with_middle
#   description = Faker::Lorem.sentence(3, true, 4)
#   Author.create!(name: name, description: description)
# end

99.times do |n|
  publiser_name = Faker::Company.name
  description = Faker::Lorem.sentence(3, true, 4)
  phone_number = Faker::PhoneNumber.phone_number
  email = Faker::Internet.email
  street_address = Faker::Address.street_address
  city = Faker::Address.city
  street_name = Faker::Address.street_name
  country = Faker::Address.country
  address = "#{street_address}, #{street_name}, #{city}, #{country}"
  Publisher.create!(name: publiser_name, description: description, email: email,
    phone_number: phone_number, address: address)
end
