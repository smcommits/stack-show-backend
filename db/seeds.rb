# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

images_array = %w[product-factory-landing-page-for-adobe-xd_p0ml47
                  treva-job-hiring-landing-page-for-sketch_prcaox
                  tour-and-travel-website-for-figma_mjmplf
                  photographer-free-landing-page-for-figma_yrucfg
                  trafalgar-landing-page-for-figma_qoa6nw
                  social-meetup-landing-page-for-sketch_gowrlp
                  shoply-landing-page_tmn14s
                  shoply-one-page_rw1b4t
                  Sello-Mininal-E-Commerce-Creative-Website-Template_nljdrp
                  Shards-A-Free-Modern-UI-Kit_zoqlw7
                  shards-dashboard-lite_qnb6lt
                  mobile-app-landing-page_pfw1uy
                  music-app-landing-page-for-sketch_sqqr7x
                  planguru-ui-kit_ch6dbl
                  photograph-class-website_mzhadd
                  medi-free-meditation-web-headers-for-figma_vjtkjl
                  explord-free-ui-kit-for-adobe-xd_fvcxaz
                  minimal-black-white-website_n2hwst
                  liquid-design-system_fma0ka
                  mimini_vbdktg
                  architecture-landing-page-for-figma_qowrv8
                  lfa-fashion-agency-web-template_k86olh
                  hello-landing-page_bkoio0
                  data-warehouse-landing-page-for-figma_jupfsk
                  gohub-landing-page_yic9pp
                  free-ui-elements-1_mrrfb9
                  Global_oheftu
                  evelyn_jxama8
                  edd-landing-page_hsul0b
                  digital-marketing-landing-page-for-sketch_zvlmzi
                  case-craft-landing-kit-for-adobe-xd_jgxfof
                  deck-1_c22x9i
                  dropcast_tw4utb
                  cruuunchify-for-invision-studio_z2kw4v
                  Covid-19-Landing-Page-For-Figma_c3qk7i
                  creatively-agency-landing-page_ncygjr
                  brutalism-2_e2obik
                  bdjy4vr63wjcfktn4mjo_cxiwbc]

user_images = %w[ndemf32rf6mrnvwaty40
                 efmqzebhpzu7r6j9rlyj
                 hpsijzrysxt5gn5t0gvq
                 pammp4qh4j21rinp84ei
                 gdzj2skwgrbibyvlrvpg
                 itfb3udesvfnaxwjd5je
                 msmbth6qpi4mr74g3yud
                 kfboho2895wkmiprh4dl
                 rida52nm0ee6dd2umjwu
                 ws5fpk94l23bd7xu21ea
                 evh8oyql76y0cgcd1gvl
                 psvxmxhffltfui7kpwfg
                 pbbvnydiu8kkbmqbvjcu
                 lmzkg6dbhyqwjvurep5z
                 a6s8hjtegimpyctfkm3l
                 fzgt5l8yplqerxo8zg0r
                 rwlxwyfygvcghr6ewqbx
                 c6kbiaarlmqeixqeeqnx
                 zpfe6wcntrpar1f2kdd5
                 oazdaqhacmpojtg9livz
                 pr6hihx1lsymqbtgd8ak
                 mgxj7lmrg2odu87erqld
                 wgjkfpyont5vnekgeoxl
                 h2gukhljyeo5ms1lwznj
                 qoubt5iacth8ew0ghebr
                 sftslgkou9ghlmmlka3l
                 hkc32z7f4rtonfq9uett
                 tw14tveson1k0porjdlc
                 mq6tqdyedpneopcnpe7i
                 aeowigttqobeqnjgtft0
                 cl7xhfavduq0bwadonfs
                 v8nq4x9r11cr3bhgcm4b
                 ziqv3h6kodaaunmlifms
                 pfuwoefpfojbzjallqli
                 tqtol8ajqsabtgjq622t
                 f7mf9c10wqkoxvgjzhz2
                 cavetowajawco9ffjbeq
                 bpzq456glu09jefwze8l
                 e74ur2kpdvcwmgspcs9a
                 zausgeojmvbclerdz6fe
                 pdc9zidn9zsdyngwiwva]

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
