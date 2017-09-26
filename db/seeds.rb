# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Book.destroy_all
Author.destroy_all

30.times do
  name = Faker::Book.author.split(' ')
  author = Author.create(first_name: name[0], last_name: name[1])
  rand(1..8).times do
    Book.create(title: Faker::Book.title, author: author, date_published: Faker::Date.between(90.years.ago, Date.today))
  end
end
