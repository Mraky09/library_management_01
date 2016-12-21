User.create!(name: "Tuan Anh Tran Nguyen",
  email: "anhtnt09@gmail.com",
  password: "foobar",
  is_admin: true)

99.times do |n|
  name = Faker::Lorem.word
  description = Faker::Lorem.sentence(3, true, 4)
  Category.create!(name: name, description: description)
end
