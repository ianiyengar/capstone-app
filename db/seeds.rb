# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!({ name: "Ian", email: "ian1@test.com", password: "password" })
User.create!({ name: "David", email: "david1@test.com", password: "password" })
User.create!({ name: "Jay", email: "jay1@test.com", password: "password" })

Artist.create!({ name: "Bon Iver" })
Artist.create!({ name: "Field Report" })
Artist.create!({ name: "King Gizzard and the Lizard Wizard" })
Artist.create!({ name: "Phil Cook" })
Artist.create!({ name: "Francis and the Lights" })
Artist.create!({ name: "Ghost" })
Artist.create!({ name: "The Sword" })
Artist.create!({ name: "Hiss Golden Messenger" })
Artist.create!({ name: "John Prine" })
Artist.create!({ name: "Metallica" })
Artist.create!({ name: "The Beatles" })
Artist.create!({ name: "Eagles" })
Artist.create!({ name: "AC/DC" })

Album.create!({ name: "22, A Million", artist_id: "1", cover_art_url: "https://images-na.ssl-images-amazon.com/images/I/81J5Mr-uSCL._SL1400_.jpg" })
Album.create!({ name: "Summertime Songs", artist_id: "2" })
Album.create!({ name: "Infest The Rats' Nest", artist_id: "3" })
Album.create!({ name: "i,i", artist_id: "1" })
Album.create!({ name: "As Far as I Can See", artist_id: "4" })
Album.create!({ name: "Just For Us", artist_id: "5" })
Album.create!({ name: "Meliora", artist_id: "6" })
Album.create!({ name: "High Country", artist_id: "7" })
Album.create!({ name: "Quietly Blowing It", artist_id: "8" })
Album.create!({ name: "John Prine Live", artist_id: "9" })
Album.create!({ name: "Metallica", artist_id: "10" })
Album.create!({ name: "Abbey Road", artist_id: "11" })
Album.create!({ name: "Bon Iver, Bon Iver", artist_id: "1" })
Album.create!({ name: "Ride The Lightning", artist_id: "10" })
Album.create!({ name: "Magical Mystery Tour", artist_id: "11" })
Album.create!({ name: "Eagles", artist_id: "12" })
Album.create!({ name: "Hotel California", artist_id: "12" })
Album.create!({ name: "Let There Be Rock", artist_id: "13" })
Album.create!({ name: "Highway To Hell", artist_id: "13" })
Album.create!({ name: "Ballbreaker", artist_id: "13" })
Album.create!({ name: "Kill Em' All", artist_id: "10" })

TopTen.create!({ album_id: 1, user_id: 1 })
TopTen.create!({ album_id: 2, user_id: 1 })
TopTen.create!({ album_id: 3, user_id: 1 })
TopTen.create!({ album_id: 4, user_id: 1 })
TopTen.create!({ album_id: 5, user_id: 1 })
TopTen.create!({ album_id: 6, user_id: 1 })
TopTen.create!({ album_id: 7, user_id: 1 })
TopTen.create!({ album_id: 8, user_id: 1 })
TopTen.create!({ album_id: 9, user_id: 1 })
TopTen.create!({ album_id: 10, user_id: 1 })
