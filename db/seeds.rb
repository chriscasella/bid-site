# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Auction.destroy_all

user1 = User.create(company_name: "Test User", contact_first_name: "Alan", contact_last_name: "Watts", email: "test@test.com", password: "password")
user2 = User.create(company_name: "Company Test Name", contact_first_name: "Martin", contact_last_name: "Heidegger", email: "whyanything@test.com", password: "password")
user3 = User.create(company_name: "Second Test Name", contact_first_name: "Thich Nhat", contact_last_name: "Hanh", email: "plumvillage@test.com", password: "password")
auction1 = Auction.create(name: "Auction Title 1", location: "Philadelpia, PA", auction_start_date: Time.now, auction_close_date: Time.now, user_id: 6)
auction2 = Auction.create(name: "Auction Title 2", location: "Philadelpia, PA", auction_start_date: Time.now, auction_close_date: Time.now, user_id: 6)
auction3 = Auction.create(name: "Auction Title 3", location: "Philadelpia, PA", auction_start_date: Time.now, auction_close_date: Time.now, user_id: 6)
auction4 = Auction.create(name: "Auction Title 4", location: "Philadelpia, PA", auction_start_date: Time.now, auction_close_date: Time.now, user_id: 6)
auction5 = Auction.create(name: "Auction Title 5", location: "Philadelpia, PA", auction_start_date: Time.now, auction_close_date: Time.now, user_id: 7)
bid1 = Bid.create(user_id: user3.id, auction_id: auction1.id, bid_quote: 30000)
bid1 = Bid.create(user_id: user2.id, auction_id: auction1.id, bid_quote: 50000)
