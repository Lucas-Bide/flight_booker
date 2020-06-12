# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airport.delete_all
Flight.delete_all

airports = Airport.create([{ code: 'SFO' }, { code: 'NYC' }, { code: 'DC' }, { code: 'OFL' }, { code: 'RVA' }])

10.times do |i|
  ap = [Airport.find(1), Airport.find(2)]
  ap.reverse! if i % 2 == 0
  Flight.create(start: DateTime.new(2020, rand(1..12), rand(1..31), rand(0..23), rand(0..59)) , duration: "#{rand(1..4)} hours", to_airport_id: ap[0].id, from_airport_id: ap[1].id)
end

s = Flight.all.map { |f| { m: f.start.month, d: f.start.day } }

20.times do |i|
  ap = [Airport.find(1), Airport.find(2)]
  ap.reverse! if i % 2 == 0
  sr = rand(0..9)
  Flight.create(start: DateTime.new(2020, s[sr][:m], s[sr][:d], rand(0..23), rand(0..59)), duration: "#{rand(1..4)} hours", to_airport_id: ap[0].id, from_airport_id: ap[1].id)
end