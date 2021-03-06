class UserMailer < ApplicationMailer

  def new_auction(auction)
    @auction = auction
    mail(
    to: auction.user.email,
    subject: "Your auction #{auction.name} has been created!"
    )
  end

  def new_bid(auction, bid)
    @auction = auction
    @bid = bid
    mail(
    to: bid.user.email,
    subject: "Your bid has been submitted!"
    )
  end

  def winning_bid_selected(auction, bid)
    @auction = auction
    @bid = bid
    mail(
    to: bid.user.email,
    subject: "Your bid won"
    )
  end

  def winning_bid_selector(auction, bid)
    @auction = auction
    @bid = bid
    mail(
    to: auction.user.email,
    subject: "Your auction has concluded, details inside"
    )
  end
end
