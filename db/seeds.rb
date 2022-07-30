require 'faker'
require 'open-uri'

# global variables
avatars_photos = [
          'https://res.cloudinary.com/jencodes101/image/upload/v1659025677/development/leg8yaohnm14ymbpuuf9yakjdp8a.jpg',
          'https://res.cloudinary.com/jencodes101/image/upload/v1658918147/development/63ryopg11ywsfgbxxrv77dwu01y9.jpg',
          'https://res.cloudinary.com/jencodes101/image/upload/v1659181425/development/exports-1_qy2bkm.jpg',
          'https://res.cloudinary.com/jencodes101/image/upload/v1659181198/development/Erin-10.17Exports-36_bb08qp.jpg',
          'https://res.cloudinary.com/jencodes101/image/upload/v1659181289/development/Nightlife_bts-002_f1tsw9.jpg'
          ]
# make hosts x 5
puts "creating users- hosts ..."
avatars_photos.each do |avatar|
  user = User.new(
    first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
    username: Faker::Games::SuperSmashBros.fighter, email: Faker::Internet.email,
    password: 'dejavu845'
  )
  user.role = 'host'
  file = URI.open(avatar)
  user.photo.attach(io: file, filename: "#{Faker::Name.first_name}.jpg", content_type: 'image/png')

  puts "saving user-#{user.id}"
  user.save!
  puts user

  puts 'user saved'
end
puts 'user-host seeding complete ✅'

# make excursions x5
puts 'creating excursions with host .... '
excursion = Excursion.new(
  name: "guided history tour through old town",
  description: "Dragons, castles, and tales, oh my! Walk with me through Krakow and dive into our rich history!",
  address: "Basztowa, 30-547 Kraków, Poland",
  country: "poland",
  user_id: 1
)
file = URI.open("https://res.cloudinary.com/jencodes101/image/upload/v1659189594/development/krakow-main-square-GettyRF_530609539_zibozb.jpg")
excursion.photo.attach(io: file, filename: "#{excursion.name}.jpg", content_type: 'image/png')
puts "saving excursion "
excursion.save!

int = 0
excursion_photos = ["https://res.cloudinary.com/jencodes101/image/upload/v1659189595/development/Greece_Optimized_-5e580fa45d9f1_ljolmg.jpg",
                    "https://res.cloudinary.com/jencodes101/image/upload/v1659110738/development/1o91mb49fvd546z60ggc4wiyr5s4.jpg", "https://res.cloudinary.com/jencodes101/image/upload/v1659024760/development/l9autzod1c075xawxir0660v0wwt.jpg",
                    "https://res.cloudinary.com/jencodes101/image/upload/v1659025721/development/f5cg5yh2fdadt9412er56uftudhh.jpg",
                    "https://res.cloudinary.com/jencodes101/image/upload/v1659110738/development/1o91mb49fvd546z60ggc4wiyr5s4.jpg"]

locations = ["Kamari 847 00, Greece", "Parco Federico Fellini, 47921 Rimini RN, Italy",
            "5J98+V5 La Ciotat, France","Nazaré, Portugal", "Madrid,Spain",
            "C. Agustín Montes Fuentes, 7, 29002 Málaga", "Fižela, 52100, Pula, Croatia"
            ]

countries = ["greece", "Italy", "France", "Portugal", "Spain", "Croatia"]
User.all.each do |host|
  excursion = Excursion.new(
    name: Faker::Hobby.activity, description: Faker::Lorem.sentence(word_count: 20),
    country: countries[int],
    address: locations[int],
    user_id: host.id, price: rand(10.99..99.99).round(2), capacity: rand(5..30)
  )
  file = URI.open(excursion_photos[int])
  excursion.photo.attach(io: file, filename: "#{excursion.name}.jpg", content_type: 'image/png')
  puts "saving excursion"
  excursion.save!
  int += 1

end
puts Excursion.count
puts 'excursion seeding complete ✅'


# make guests x
5.times do
  user = User.new(
    first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
    username: Faker::Games::SuperSmashBros.fighter, email: Faker::Internet.email,
    password: 'dejavu845'
  )
  user.role = 'guest'
  user.save!
  puts "saving user-#{user.id}"
end
puts 'user-guest seeding complete ✅'

# make bookings x 5
puts 'creating bookings with user-guest and excursions...'
number = 5

number.times do |num|
  booking = Booking.new(
    start_time: Faker::Time.forward(days: num, period: :morning),
    end_time: Faker::Time.forward(days: num, period: :evening),
    excursion_id: Excursion.first.id,
    user_id: num + 5
  )
  puts "saving booking"
  booking.save!
end
puts 'booking seeding complete ✅'

puts 'seeding is compete 🟩🟩🟩🟩🟩🟩'

# iterate over
