# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(f_name: "Charles",l_name: "Anderson",email: "caa@gmail.com", password: "1234", password_confirmation: "1234")
u2 = User.create(f_name: "James", l_name: "Anderson", email: "jpa@gmail.com", password: "1234", password_confirmation: "1234")

ffc = Category.create(title: "Favs Foods")
gac = Category.create(title: "General Assembly")
jwc = Category.create(title: "Jimmy's world")

Blog.create(title: "favorite food ex 1 title", body: "ex1 body", user: u1, category: ffc)
Blog.create(title: "general assembly ex 2 title", body: "ex2 body", user: u2, category: gac)




