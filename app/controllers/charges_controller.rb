class ChargesController < ApplicationController
  def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Property Manager Membership - #{current_user.name}",
     amount: Amount.default
   }
  end

  def create
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id
     amount: Amount.default,
     description: "Property Manager Membership - #{current_user.email}",
     currency: 'usd'
   )

   flash[:notice] = "Thanks for joining, #{current_user.email}!"
   redirect_to :root # or wherever

 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
 rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path
 end
end
