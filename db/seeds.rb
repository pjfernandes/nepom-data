# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ship = Ship.new
ship.name = %w[Calipso Kontiki Pequod Pinta Palestrante Revenge].sample
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
''
