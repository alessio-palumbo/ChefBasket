class OrderProductsController < ApplicationController
  # before_action :set_order_product, only: [:new]
  def index
    @order = Order.find(params[:order])
    @order_products = OrderProducts.where(order_id: @order)
  end

  def show 
  end


  def new
    @order = Order.find(params[:order])
    @supplier = @order.supplier
    @order_product = OrderProduct.new
    
    if params[:search]
      @product = @supplier.products.search(params[:search])
    else
      @products = @supplier.products
    end
  end

  def create
    @order = Order.find(params[:order_id])
    @selected_products = Product.where(id: params[:product_id])
    @selected_products.each_with_index do |prod, idx|
      if params[:quantity][idx] != '0'
        OrderProduct.create!(order_id: @order.id, product_id: prod.id, quantity: params[:quantity][idx])
      end
    end

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_order_product
    @order_product = OrderProduct.find(params[:id])
  end

end
