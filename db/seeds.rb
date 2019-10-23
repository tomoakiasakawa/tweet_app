# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do |n|
  name  = "Test User#{ n + 1 }"
  email = "example-#{ n + 1 }@example.com"
  user = User.create!(name:  name, email: email)
  80.times do |i|
    user.tweets.create(content: "test tweet#{ i }")
  end
end
