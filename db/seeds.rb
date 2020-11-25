# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "DB seed start"

Review.destroy_all
Ticket.destroy_all
User.destroy_all
Product.destroy_all
Store.destroy_all

store = Store.create(name:"Bron", address:"Lyon")

user = User.create(store_id: store.id, nickname: "Bob", email:"toto@gmail.com", password:"azerty")

puts user.errors.full_messages
puts "DB seed end"
