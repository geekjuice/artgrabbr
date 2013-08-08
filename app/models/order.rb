class Order < ActiveRecord::Base
  belongs_to :artwork
  belongs_to :buyer

  validates :artwork_id, presence: true
  validates :buyer_id, presence: true
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX}
  validates :inquirymessage, length: { maximum: 400 }
  validates :requested_price, presence: true, :numericality => { :greater_than => 0}

  attr_accessible 	:address, :city, :state, :zipcode,
  					:email, :name, :subtotal, :total, :artwork_id, :buyer_id, :inquirymessage, 
            :requested_price, :stripe_card_token 


  attr_accessor :stripe_card_token

  def save_with_payment
    @artwork = Artwork.find(artwork_id)
  	if valid?
      charge = Stripe::Charge.create( :amount => (@artwork.price*100).to_i,
                                      :currency => "usd", 
                                      :description => @artwork.title + " sold to " + name,
                                      :card => stripe_card_token )
      save!
    end
	rescue Stripe::InvalidRequestError => e
		logger.error "Stripe error while creating customer: #{e.message}"
		errors.add :base, "There was a problem with your credit card."
		false
  end
end 
