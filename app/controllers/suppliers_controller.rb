class SuppliersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @food_business = FoodBusiness.find(params[:food_business])

    if params[:search]
      @my_suppliers = @food_business.suppliers.search(params[:search])
      @suppliers = Supplier.search(params[:search]) - @my_suppliers
    else
      @my_suppliers = @food_business.suppliers
      @suppliers = Supplier.all - @my_suppliers
    end
  end

  def show
  end

  def new
    @supplier = Supplier.new
  end

  def edit
  end

  def create
    @supplier = Supplier.new(supplier_params)
    @supplier.user = current_user
    @supplier.business_name = current_user.company_name

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to @supplier, notice: 'Supplier was successfully created.' }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:food_business] 
      @food_business = FoodBusiness.find(params[:food_business])
      if @supplier.food_businesses.include? @food_business
        @supplier.food_businesses.delete(@food_business)
      else 
        @supplier.food_businesses << @food_business        
      end
      redirect_to request.referrer
      
      # respond_to do |format|
      #     format.js 
      # end
      # redirect_to food_businesss_path(food_business: @food_business) and return

    end
    respond_to do |format|
      if @supplier.update(supplier_params)
       
        format.html { redirect_to home_path, notice: 'Supplier was successfully updated.' }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      if current_user.user_type == 'Supplier'
        @supplier = current_user.supplier
      else
        @supplier = Supplier.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:business_name, :address, :abn_number, :contact_number, :supplier_type, :email, :image)
    end

end
