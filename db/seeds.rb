# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
require 'cloudinary'

puts 'Cleaning up database...'
Occurrence.destroy_all
Crew.destroy_all
Ship.destroy_all
Member.destroy_all
User.destroy_all
USERS = [
  { name: 'Pret', email: 'lc@lewagon.com', password: '123456' },
  { name: 'Marcelo', email: 'marcelo@lewagon.com', password: '123456' },
  { name: 'Pedro', email: 'pedro@lewagon.com', password: '123456' },
  { name: 'Tati', email: 'tati@lewagon.com', password: '123456' }
]
SHIPS = [
  { name: 'Pinta', registration: '23456', registration_port: 'Hamburg' },
  { name: 'Kontiki', registration: '23098', registration_port: 'Santos' },
  { name: 'Calipso', registration: '45678', registration_port: 'Salvador' },
  { name: 'Pequod', registration: '98765', registration_port: 'Nantucket' },
  { name: 'Palestrante', registration: '34521', registration_port: 'Rio de Janeiro' },
  { name: 'Revenge', registration: '76543', registration_port: 'Paranaguá' }
]
COORDINATES = [
  { lat: -20.320733, long: -40.288746 },
  { lat: -20.321850, long: -40.287309 },
  { lat: -20.325063, long: -40.305819 },
  { lat: -20.328395, long: -40.309506 },
  { lat: -20.304786, long: -40.288989 },
  { lat: -20.300593, long: -40.288322 },
  { lat: -20.385191, long: -40.248976 },
  { lat: -20.397916, long: -40.240126 },
  { lat: -20.320289, long: -40.301764 }
]
MEMBERS = (
  JSON.parse((URI.open('https://randomuser.me/api/?nat=br,us,fr,gb&inc=name,dob,id,picture&results=100').read))
)['results']
  puts '<<<< Database cleaned >>>>'
puts '------------------------'
puts ''
users = User.create!(USERS)
puts 'Creating users'
users.each { |user| puts "#{user.name} created" }
puts '4 users created'
puts '------------------------'
puts ''

ships = Ship.create!(SHIPS)
puts 'Creating ships'
ships.each { |ship| puts "#{ship.name} created" }
puts '6 ships created'
puts '------------------------'
puts ''
puts 'Creating members'
members = []
MEMBERS.each do |member|

  member = Member.create!(
    name: "#{member['name']['first']} #{member['name']['last']}",
    birth: member['dob']['date'],
    doc_number: member['id']['value'].to_s,
    doc_type: member['id']['name'].to_s,
    image: member['picture']['large'].to_s
  )

  file = URI.open(member.image)
  puts member.image
  member.photo.attach(io: file, filename: "image.jpg", content_type: 'image/jpg')
  member.save

  members << member
end
puts '300 members created'
puts '------------------------'
puts ''
puts 'Creating crews'
ships.each do |ship|
  20.times do
    date_ini = Faker::Date.between(from: '2019-01-01', to: '2021-11-09')
    date_fin = Faker::Date.between(from: date_ini.to_s, to: '2021-11-09')
    rand(5..10).times do
      Crew.create!(
        date_ini: date_ini,
        date_fin: date_fin,
        member: members.sample,
        ship: ship
      )
    end
  end
end
puts 'Crews created'
puts '------------------------'
puts ''
puts 'Creating occurrences'
50.times do
  coordinate = COORDINATES.sample
  Occurrence.create!(
    date: Faker::Date.between(from: '2019-01-01', to: '2021-11-09'),
    user: users.sample,
    ship: ships.sample,
    latitude: coordinate[:lat] + rand(-0.0009..0.0009),
    longitude: coordinate[:long] + rand(-0.0009..0.0009)
  )
end
puts '50 occurrences created'
