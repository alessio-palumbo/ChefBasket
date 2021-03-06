class FoodBusinessesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food_business, only: [:home, :show, :edit, :update, :destroy]

  def home
    session[:food_business_id] = @food_business.id
  end

  def index
    if current_user.user_type == 'Food Business'
      @food_businesses = FoodBusiness.where(user: current_user)
    else
      @supplier = current_user.supplier
      @my_clients = @supplier.food_businesses 
      @food_businesses = FoodBusiness.all - @my_clients
      if params[:search]
        @my_clients = @supplier.food_businesses.search(params[:search])
        @food_businesses = FoodBusiness.search(params[:search]) - @my_clients 
      end 
    end 
  end

  def show
  end

  def new
    @food_business = FoodBusiness.new
  end
  
  def edit
  end
  
  def create
    @food_business = FoodBusiness.new(food_business_params)
    @food_business.user = current_user

    respond_to do |format|
      if @food_business.save
        format.html { redirect_to @food_business, notice: 'Food business was successfully created.' }
        format.json { render :show, status: :created, location: @food_business }
      else
        format.html { render :new }
        format.json { render json: @food_business.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:supplier] 
      @supplier = Supplier.find(params[:supplier])
      if @food_business.suppliers.include? @supplier
        @food_business.suppliers.delete(@supplier)
      else 
        @food_business.suppliers << @supplier        
      end
      redirect_to request.referrer
      # respond_to do |format|
      #     format.js {render inline: "window.location.reload();" }
      # end
      # redirect_to suppliers_path(food_business: @food_business) and return

    end
    respond_to do |format|
      if @food_business.update(food_business_params)
        format.html { redirect_to @food_business, notice: 'Food business was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_business }
      else
        format.html { render :edit }
        format.json { render json: @food_business.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food_business.destroy
    respond_to do |format|
      format.html { redirect_to food_businesses_url, notice: 'Food business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_food_business
      @food_business = FoodBusiness.find(params[:id])
    end

    def food_business_params
      params.require(:food_business).permit(:business_name, :address, :abn_number, :contact_number, :business_category, :email, :image)
    end
end
