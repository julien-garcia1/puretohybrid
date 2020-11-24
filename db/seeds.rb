# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "DB seed start"

Product.destroy_all
Ticket.destroy_all
User.destroy_all
Store.destroy_all

store = Store.create(name:"Bron", address:"Lyon")

user = User.create(store_id: 5, nickname: "Bob", email:"toto@gmail.com", password:"azerty")




product = Product.create(store: store, name:"velo", price:12, description:"trop top", category: "VTT", sku:"2314FZE")
product2 = Product.create(store: store, name:"chaussure", price:2, description:"incroyable", category: "running", sku:"2376FZE")
product3 = Product.create(store: store,name:"tente", price:32, description:"génial", category: "camping", sku:"2314ERE")
product4 = Product.create(store: store,name:"short", price:22, description:"nul", category: "fitness", sku:"2234FZE")




puts user.errors.full_messages

ticket = Ticket.create(user: user, status:"en cours", client_firstname:"tata")
puts "DB seed end"
