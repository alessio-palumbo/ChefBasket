class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_food_business, only: [:new, :create, :destroy]

  def index
    if params[:food_business]
      @food_business = FoodBusiness.find(params[:food_business])
      @orders = @food_business.orders if @food_business.orders
    elsif params[:supplier]
      @supplier = Supplier.find(params[:supplier])
      @orders = Order.where("supplier_id = ? AND delivery_date <= ?", @supplier, Date.today)
      @new_orders = Order.where("supplier_id = ? AND delivery_date > ?", @supplier, Date.today)
    end 
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.food_business = @food_business

    # @amount = 500
    
    # customer = Stripe::Customer.create(
    #   :email => @food_business.email,
    #   :source  => params[:stripeToken]
    # )
    # charge = Stripe::Charge.create(
    #   :customer    => customer.id, 
    #   :amount      => @amount,
    #   :description => @order.order_number,
    #   :currency    => 'aud'
    # )
  
    respond_to do |format|
      if @order.save
        format.html { redirect_to new_order_product_path(order: @order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { redirect_to new_order_path(food_business: @food_business) }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to orders_path(food_business: @food_business)
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_path(food_business: @food_business), notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_food_business
      @food_business = FoodBusiness.find(params[:food_business])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:delivery_date, :supplier_id, :order_number)
    end
end