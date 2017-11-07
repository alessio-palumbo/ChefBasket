class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_food_business, only: [:index, :new, :create, :destroy]

  def index
    if @food_business.orders
      @orders = @food_business.orders
    end
  end

  def show
  end

  def new
    @order = Order.new
    @order.food_business = @food_business
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.food_business = @food_business

    respond_to do |format|
      if @order.save
        format.html { redirect_to new_order_product_path(order: @order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
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
