class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  load_and_authorize_resource

  #rescuing and redirecting users in case they are not authorized
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to main_app.root_url, alert: exception.message
    end

  def index
    @orders = Order.includes(:product).all
  end

  def show
    @orders = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

# POST /orders
# POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.'}
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to @order, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:user_id, :product_id, :total)
  end

end
