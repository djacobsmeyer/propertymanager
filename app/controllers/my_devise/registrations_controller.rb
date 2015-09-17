class MyDevise::RegistrationsController < Devise::RegistrationsController
  def create
    stripe_token = params[:user].delete(:stripe_card_token)

    customer = Stripe::Customer.create(
      :card => stripe_token,
      :email => params[:user][:email]
    )

    params[:user][:customer_id] = customer.id

    super

    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id
      amount: Amount.default,
      description: "Property Manager Membership",
      currency: 'usd'
    )

    redirect_to :new_user_session
  end
end
