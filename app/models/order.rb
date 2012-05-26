class Order < ActiveRecord::Base
  belongs_to :artwork

  validates :artwork_id, presence: true
  validates :name, presence: true
  validates :email, presence: true

  attr_accessible 	:address_line_1, :address_line_2, :city, :delivery_method, 
  					:email, :name, :state, :subtotal, :total, :zipcode, :artwork_id, :stripe_card_token 

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
