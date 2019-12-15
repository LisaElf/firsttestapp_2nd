class PaymentsController < ApplicationController

  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user

    #Create a charge
    begin
      charge = Stripe::Charge.create(
        amount:  100* @product.price,
        currency: "usd",
        source: token,
        description: params[:stripeEmail]
      )
      if charge.paid
        Order.create(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
        )
      end
    rescue Stripe::CardError => e
      #The Card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"

    end
    redirect_to products_path
  end

  def update
  end

end
