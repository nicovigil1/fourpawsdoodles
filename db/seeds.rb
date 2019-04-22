# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'factory_bot_rails'

include FactoryBot::Syntax::Methods

charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire", image: "http://fourpawsdoodranch.com/wp-content/gallery/four-paws-parents/Charles.jpg")
hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam", image: "http://fourpawsdoodranch.com/wp-content/gallery/four-paws-parents/HAZEL-2.jpg")
charles_litter_1 = Litter.create(name:"Hazel-Charles Jan '70", birthday:"1/1/1970", breed:"Goldendoodle", parents:[charles, hazel])
charles_litter_2 = Litter.create(name:"Hazel-Charles May '71", birthday:"5/5/1970", breed:"Goldendoodle", parents:[charles, hazel])

girl_a = Pupper.create(gender:"f", litter:charles_litter_1, image: "http://fourpawsdoodranch.com/wp-content/gallery/available-doodles_2/Murphy-Boy-A-4-17.jpg")
girl_b = Pupper.create(gender:"m", litter:charles_litter_2, image: "http://fourpawsdoodranch.com/wp-content/gallery/available-doodles_2/Kit-Boy-A-2.jpg")

User.create(username: "admin", password: "password", role: "admin")