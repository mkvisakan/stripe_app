class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 100

    puts "charges controller"
    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
 
  user = User.find(session[:user])
  user.update_attribute(:current_balance, user.current_balance + 100) 


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
