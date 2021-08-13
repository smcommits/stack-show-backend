# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

50.times do
  user=User.new(
    name: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password
  )
  user.save!
end
