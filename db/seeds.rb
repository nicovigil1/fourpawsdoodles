# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

charles = Parent.create(name:"Charles", breed:"Goldendoodle", genetics:"F1", role:"sire")
hazel = Parent.create(name:"Hazel", breed:"Moyen Goldendoodle", genetics:"F1", role:"dam")
charles_litter_1 = Litter.create(name:"charles 1", birthday:"1/1/1970", breed:"Goldendoodle", parents:[charles, hazel])
charles_litter_2 = Litter.create(name:"charles 2", birthday:"5/5/1970", breed:"Goldendoodle", parents:[charles, hazel])

girl_a = Pupper.create(gender:"f", litter:charles_litter_1)
girl_b = Pupper.create(gender:"m", litter:charles_litter_2)

User.create(username: "admin", password: "password", role: "admin")