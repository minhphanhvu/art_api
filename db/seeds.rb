# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
Comment.destroy_all

user1 = User.create!(name: 'robert')
user2 = User.create!(name: 'bill')
artwork1 = Artwork.create!(title: 'nighthawks', image_url: 'google.com', artist_id: user1.id)
artwork2 = Artwork.create!(title: 'mona lisa', image_url: 'google1.com', artist_id: user2.id)
artwork3 = Artwork.create!(title: 'elf castle', image_url: 'google3.com', artist_id: user2.id)
comment1 = Comment.create!(body: 'great!', user_id: user1.id, artwork_id: artwork1.id)
comment2 = Comment.create!(body: 'another great one', user_id: user2.id, artwork_id: artwork2.id)
comment3 = Comment.create!(body: 'your art is greate user1', user_id: user2.id, artwork_id: artwork1.id)
ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user2.id)
ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user2.id)
ArtworkShare.create!(artwork_id: artwork3.id, viewer_id: user1.id)
