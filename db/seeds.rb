# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Auction.destroy_all
Bid.destroy_all
User.destroy_all

user1 = User.create(company_name: "Test User", contact_first_name: "Alan", contact_last_name: "Watts", email: "test@test.com", password: "password")
user2 = User.create(company_name: "Company Test Name", contact_first_name: "Martin", contact_last_name: "Heidegger", email: "whyanything@test.com", password: "password")
user3 = User.create(company_name: "Second Test Name", contact_first_name: "Thich Nhat", contact_last_name: "Hanh", email: "plumvillage@test.com", password: "password")
auction1 = Auction.create(name: "Lead Water Testing", location: "Philadelpia, PA", description: "Lead water testing services needed to conduct environmental assessment of lead u/mG in drinking water. All water fixtures to be labeled as per EPA regulations. Building plans to be included to perform fixture survey.", auction_start_date: Time.now, auction_close_date: Time.now, user: user2)
auction2 = Auction.create(name: "Camden BOE Lead Paint Survey", location: "Camden, NJ", auction_start_date: Time.now, auction_close_date: Time.now, user: user3)
auction3 = Auction.create(name: "Hazardous Materials Remediation and Disposal", location: "Kearny, NJ", auction_start_date: Time.now, auction_close_date: Time.now, user: user3)
auction4 = Auction.create(name: "Federal Wildlife National Refuge Soil Investigation", location: "Little Egg Harbor, NJ", auction_start_date: Time.now, auction_close_date: Time.now, user: user1)
auction5 = Auction.create(name: "Phase I Site Assessment", location: "Easton, PA", auction_start_date: Time.now, auction_close_date: Time.now, user: user2)
auction6 = Auction.create(name: "Phase I Site Assessment", location: "Easton, PA", auction_start_date: Time.now, auction_close_date: Time.now, user: user2)
auction7 = Auction.create(name: "Phase I Site Assessment", location: "Easton, PA", auction_start_date: Time.now, auction_close_date: Time.now, user: user2)
auction8 = Auction.create(name: "Phase I Site Assessment", location: "Easton, PA", auction_start_date: Time.now, auction_close_date: Time.now, user: user2)
auction9 = Auction.create(name: "Phase I Site Assessment", location: "Easton, PA", auction_start_date: Time.now, auction_close_date: Time.now, user: user2)
auction10 = Auction.create(name: "Phase I Site Assessment", location: "Easton, PA", auction_start_date: Time.now, auction_close_date: Time.now, user: user2)
auction11 = Auction.create(name: "Phase I Site Assessment", location: "Easton, PA", auction_start_date: Time.now, auction_close_date: Time.now, user: user2)
auction12 = Auction.create(name: "Phase I Site Assessment", location: "Easton, PA", auction_start_date: Time.now, auction_close_date: Time.now, user: user2)
bid1 = Bid.create(user: user1, auction: auction1, bid_quote: 30000, winning_bid: false)
bid2 = Bid.create(user: user3, auction: auction1, bid_quote: 50000, winning_bid: false)
bid2 = Bid.create(user: user3, auction: auction1, bid_quote: 20000, winning_bid: false)
