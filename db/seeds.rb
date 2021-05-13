# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


TEAMS = ["Mercedes", "Red Bull", "Ferrari", "McLaren", "Aston Martin", "Alpine", "Williams", "AlphaTauri" "Alfa Romeo", "Haas"]
MEMBERS = [
  "Valtteri Bottas", "Lewis Hamilton", "Max Verstappen", "Sergio Perez", "Carlos Sainz", "Charles Leclerc", "Daniel Ricciardo", "Lando Norris",
  "Sebastian Vettel", "Lance Stroll", "Fernando Alonso", "Esteban Ocon", "Nicholas Latifi", "George Russell", "Yuki Tsunoda", "Pierre Gasly",
  "Kimi Räikkönen", "Antonio Giovinazzi", "Mick Schumacher", "Nikita Mazepin"
]

TEAMS.each_with_index do |t, i|
  team = Team.create(name: t)
  j = 0
  2.times do
    Member.create(name: MEMBERS[2*i+j], team: team)
    j+=1
  end
end
