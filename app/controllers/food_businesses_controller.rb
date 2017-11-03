class FoodBusinessesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food_business, only: [:home, :show, :edit, :update, :destroy]

  def home
    # @food_business = FoodBusiness.find_by(params[:business_name])
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
      params.require(:food_business).permit(:business_name, :address, :abn_number, :contact_number, :business_category, :email)
    end
end
