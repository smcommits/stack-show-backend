# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

images_array = %w[bdjy4vr63wjcfktn4mjo
                  mze03hdjcopmwqjiq3re
                  a80gkkhg9e157tqanbbc
                  hfra1eh8xp7ffsi3xqfm
                  vqah9wmcyofizlqccwja
                  l2fxhaiyhn6cbme8qorm
                  ozjavne03syq18yvaahh
                  m3i86ajk5u8okgoromj2
                  m3i86ajk5u8okgoromj2
                  h4ycoqm7bqvblbf6esb5
                  lfxx6dnho0oycwes0sae
                  f3ur7aizl5skpcfznz88
                  t9l71jbvmhmnf7ays6cs
                  oaknsygfyzahyubzhsc1
                  xjcqow5yfeifiewthlm2
                  uuvgcmolayymvtmnnzft
                  nnfhowrpnqh06i07ipjh
                  jn5glogoftlcc8ahp65y]

20.times do
  user = User.new(
    name: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password
  )
  user.save!
end

users = User.order(:created_at).take(17)

users.each_with_index do |user, index|
  title = Faker::App.name
  image_path = images_array[index]
  description = Faker::Lorem.paragraph_by_chars(number: 2000)
  github_url = ''
  live_demo = ''
  stack_list = []
  rand(1...5).times do
    stack_list.push(Faker::ProgrammingLanguage.name)
  end

  user.projects.create!(title: title, image_path: image_path, description: description, github_url: github_url,
                        live_demo: live_demo, stack_list: stack_list)
end

Project.all.each do |project|
  User.all.each do |user|
    project.ratings.create!(stars: rand(2..5), user_id: user.id)
  end
end
