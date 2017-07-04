class UserMailer < ApplicationMailer

  def new_auction(auction)
    @auction = auction
    mail(
    to: auction.user.email,
    subject: "Your auction #{auction.name} has been created!"
    )
  end
end
