# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
user=50.times{
    name=Faker::Name.unique.name
    email=Faker::Internet.email
    pass='12345678'
    User.create(name: name,email: email,password: pass)
}