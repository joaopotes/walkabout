require 'faker'
# make hosts x 5
puts "creating users- hosts ..."
5.times do
  user = User.new(
    first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
    username: Faker::Games::SuperSmashBros.fighter, email: Faker::Internet.email,
    password: 'dejavu845'
  )
  user.role = 'host'

  puts "saving user-#{user.id}"
  user.save!
  puts user

  puts 'user saved'
end
puts 'user-host seeding complete ✅'

# make excursions x5
puts 'creating excursions with host .... '
User.all.each do |host|
  Excursion.create(
    name: Faker::Hobby.activity, description: Faker::Lorem.sentence(word_count: 15),
    country: Faker::Address.country,
    location: "#{Faker::Address.latitude},#{Faker::Address.longitude}",
    user_id: host.id, price: rand(10.99..99.99).round(2), capacity: rand(5..30)
  )
  puts "saving excursion #{Excursion.last.id}"
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
