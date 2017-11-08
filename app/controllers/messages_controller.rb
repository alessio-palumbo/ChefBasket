class MessagesController < ApplicationController
  before_action :find_conversation!

  def new
    redirect_to conversation_path(@conversation) and return if @conversation
    @message = Message.new
  end
  
  def create
    
    @conversation ||= Conversation.create!(food_business_id: @food_business.id, supplier_id: @supplier.id) 

    @message = Message.new(message_params)
    @message.sender = current_user
    @message.conversation = @conversation

    respond_to do |format|
      if @message.save!
        format.html { redirect_to @conversation }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

  def message_params
    params.require(:message).permit(:content, :supplier_id, :food_business_id)
  end

  def find_conversation!
    if params[:supplier_id] && params[:food_business_id]
      @supplier = Supplier.find_by(id: params[:supplier_id])
      @food_business = FoodBusiness.find_by(id: params[:food_business_id])
      # redirect_to(conversations_path) and return unless (@supplier && @food_business)
      @conversation = Conversation.where(food_business_id: @food_business.id, supplier_id: @supplier.id).first
    else
      @conversation = Conversation.find_by(id: params[:conversation_id])
      # redirect_to(conversations_path) and return unless @conversation
      #  && @conversation.participates?(current_user)
    end
  end
end

