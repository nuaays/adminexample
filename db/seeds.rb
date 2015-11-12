# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#admin_user1 = User.create(name: "Teresa Vertiz", email: "mterevr@me.com", password: "Admin123", password_confirmation: "Admin123", admin: true)

admin_user = User.create(name: "Carlos Cruz", email: "carlos@connectcenter.mx", password: "Qwerty123", password_confirmation: "Qwerty123", admin: true, posts: true, projects:true)
admin1 = User.create(name: "Pablo Lujambio", email: "eugenio@nuva.rocks", password: "Hola123", password_confirmation: "Hola123", admin: true, posts:true)
admin1 = User.create(name: "Ilse Alejo", email: "hola@nuva.rocks", password: "Hola123", password_confirmation: "Hola123", admin: true, projects:true)
