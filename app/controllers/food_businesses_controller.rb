class FoodBusinessesController < ApplicationController
  before_action :set_food_business, only: [:show, :edit, :update, :destroy]

  # GET /food_businesses
  # GET /food_businesses.json
  def index
    @food_businesses = FoodBusiness.all
  end

  # GET /food_businesses/1
  # GET /food_businesses/1.json
  def show
  end

  # GET /food_businesses/new
  def new
    @food_business = FoodBusiness.new
  end

  # GET /food_businesses/1/edit
  def edit
  end

  # POST /food_businesses
  # POST /food_businesses.json
  def create
    @food_business = FoodBusiness.new(food_business_params)

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

  # PATCH/PUT /food_businesses/1
  # PATCH/PUT /food_businesses/1.json
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

  # DELETE /food_businesses/1
  # DELETE /food_businesses/1.json
  def destroy
    @food_business.destroy
    respond_to do |format|
      format.html { redirect_to food_businesses_url, notice: 'Food business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_business
      @food_business = FoodBusiness.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_business_params
      params.require(:food_business).permit(:business_name, :address, :abn_number, :contact_number, :business_category, :user_id)
    end
end
