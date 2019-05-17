# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create(name: 'Francisco', last_name: 'Borie', email: 'fjborie@miuandes.cl', phone: '987654321', password: 'password123', address: 'San Carlos de Apoquindo 2200')
user_2 = User.create(name: 'Diego', last_name: 'Beckdorf', email: 'dbeckdorf@miuandes.cl', phone: '987654321', password: 'password123', address: 'San Carlos de Apoquindo 2200')
user_3 = User.create(name: 'Maximiliano', last_name: 'Garcia', email: 'mrgarcia1@miuandes.cl', phone: '987654321', password: 'password123', address: 'San Carlos de Apoquindo 2200')
