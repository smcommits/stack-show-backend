# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

images_array = ['https://res.cloudinary.com/dfsniizqr/image/upload/v1628838066/bdjy4vr63wjcfktn4mjo.png',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628838044/mze03hdjcopmwqjiq3re.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628838020/a80gkkhg9e157tqanbbc.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628838009/hfra1eh8xp7ffsi3xqfm.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628837992/vqah9wmcyofizlqccwja.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628837966/l2fxhaiyhn6cbme8qorm.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628837954/ozjavne03syq18yvaahh.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628837933/m3i86ajk5u8okgoromj2.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628837933/m3i86ajk5u8okgoromj2.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628837840/h4ycoqm7bqvblbf6esb5.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628837813/lfxx6dnho0oycwes0sae.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628837794/f3ur7aizl5skpcfznz88.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628837784/t9l71jbvmhmnf7ays6cs.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628837764/oaknsygfyzahyubzhsc1.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628837692/xjcqow5yfeifiewthlm2.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628837673/uuvgcmolayymvtmnnzft.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628828142/nnfhowrpnqh06i07ipjh.jpg',
                'https://res.cloudinary.com/dfsniizqr/image/upload/v1628826687/jn5glogoftlcc8ahp65y.jpg']


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
  image_url = images_array[index]
  description = Faker::Lorem.paragraph_by_chars(number: 2000)
  github_url = ""
  live_demo = ""
  stack_list = []
  rand(1...5).times do 
    stack_list.push(Faker::ProgrammingLanguage.name)
  end

  user.projects.create!(title: title, image_url: image_url, description: description, github_url: github_url, live_demo: live_demo, stack_list: stack_list)

end
