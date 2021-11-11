# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Cleaning up database...'
Ship.destroy_all
Member.destroy_all
Crew.destroy_all
Occurrence.destroy_all
puts '<<<< Database cleaned >>>>'
puts '------------------------'
puts ''
ships = Ship.create(
  [
    { name: 'Pinta', registration: '23456', registration_port: 'Hamburg' },
    { name: 'Kontiki', registration: '23098', registration_port: 'Santos' },
    { name: 'Calipso', registration: '45678', registration_port: 'Salvador' },
    { name: 'Pequod', registration: '98765', registration_port: 'Nantucket' },
    { name: 'Palestrante', registration: '34521', registration_port: 'Rio de Janeiro' },
    { name: 'Revenge', registration: '76543', registration_port: 'Paranaguá' }
  ]
)
puts 'Creating ships'
ships.each { |ship| puts "#{ship.name} created" }
puts '------------------------'
puts ''
puts 'Creating members'
members = []
30.times do
  member = Member.create!(
    name: Faker::Name.name,
    birth: Faker::Date.birthday(min_age: 18, max_age: 65)
  )
  members << member
end
puts '30 members created'
puts '------------------------'
puts ''
puts 'Creating crews'
ships.each do |ship|
  20.times do
    date_ini = Faker::Date.between(from: '2019-01-01', to: '2021-11-09')
    date_fin = Faker::Date.between(from: date_ini.to_s, to: '2021-11-09')
    rand(5..10).times do
      Crew.create(
        date_ini: date_ini,
        date_fin: date_fin,
        member_id: members.sample,
        ship_id: ship
      )
    end
  end
end
puts 'Crews created'
puts '------------------------'
puts ''
puts 'Creating occurrences'
coordinates = [
  { lat: -20.322646, long: -40.281658 },
  { lat: -20.320973, long: -40.278057 },
  { lat: -20.309944, long: -40.274634 },
]
50.times do
  coordinate = coordinates.sample
  Occurrence.create(
    date: Faker::Date.between(from: '2019-01-01', to: '2021-11-09'),
    user_id: rand(1..2),
    ship_id: ships.sample,
    latitude: coordinate[:lat],
    longitude: coordinate[:long]
  )
end
puts '50 occurrences created'
