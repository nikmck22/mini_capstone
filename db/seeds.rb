# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
fake_name = Faker::Book.title
fake_description = Faker::Book.genre + ", " + Faker::Book.author

product = Product.create({name: fake_name, price: 2, image_url: "text", description: fake_description})


fake_name = Faker::Book.title
fake_description = Faker::Book.genre + ", " + Faker::Book.author

product = Product.create({name: fake_name, price: 2, image_url: "text", description: fake_description})
              