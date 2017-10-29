# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  user = User.create(email: "user#{i}@example.com", screen_name: "name#{i}", password: 'password')
  5.times do |j|
    Article.create(title: "#{user.email}:title#{j}", content: "#{user.email}:title#{j}", user_id: user.id)
  end
end
