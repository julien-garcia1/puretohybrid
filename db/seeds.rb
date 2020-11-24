# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "DB seed start"

user = User.create(email:"toto@gmail.com", password:"azerty")

# product = Product.create(name:"Vélo", price:12, description:"trop top", category: "VTT", sku:"2314FZE")
puts user.errors.full_messages

ticket = Ticket.create(user: user, status:"en cours", client_firstname:"tata")
puts "DB seed end"
