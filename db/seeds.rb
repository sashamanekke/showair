# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  # Shower.create([{ address: '123 Street' }, { title: 'Clean Bathroom' }, {description: 'A very nice and clean bathroom'}, {price: 250.00}])
  # Shower.create([{ address: '456 Avenue' }, { title: 'Decent Bathroom' }, {description: 'A very decent bathroom'}, {price: 250.00}])
  # Shower.create([{ address: '23 Jordan St.' }, { title: 'Ok Bathroom' }, {description: 'A bathroom'}, {price: 250.00}])
  # Character.create(name: 'Luke', movie: movies.first)
Shower.destroy_all

User.create!([{name: "Tom", address: "67 Rub street", email: "tom@gmail.com", password: "qwerty", host: false }])



Shower.create!([{
  title: "Nice Bathroom",
  address: "Peyton Reed",
  description: "A very nice and clean bathroom",
  price: 150
},
{
  title: "Decent Bathroom",
  address:"123 street" ,
  description: "A very decent bathroom",
  price: 400
},
{
  title: "OK Bathroom",
  address: "456 avenue",
  description:"A very ok bathroom" ,
  price: 1250
}])

p "Created #{Shower.count} movies"
