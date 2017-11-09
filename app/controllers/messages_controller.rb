class MessagesController < ApplicationController
  before_action :find_conversation!

  def new
    redirect_to conversation_path(@conversation, food_business: @food_business, supplier: @supplier) and return if @conversation
    @message = Message.new
  end
  
  def create
    @conversation ||= Conversation.create!(food_business_id: @food_business.id, supplier_id: @supplier.id) 

    @message = Message.new(message_params)
    @message.sender = current_user
    @message.conversation = @conversation
    @supplier = @conversation.supplier
    @food_business = @conversation.food_business

    respond_to do |format|
      if @message.save!
        format.html { redirect_to conversation_url(@conversation, supplier: @supplier, food_business: @food_business) }
        format.json { render :show, status: :created, location: @message }

        # Send email notification to receiver
        message_to_receiver = "You have received a message from #{@message.sender.company_name} at #{@message.created_at.strftime('%l:%M %p')}. \n #{@message.content}."
        MessageMailer.message_notification(ENV.fetch('TEST_EMAIL'), "ChefBasket - Message notification", message_to_receiver).deliver_now
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
    if params[:supplier] && params[:food_business]
      @supplier = Supplier.find_by(id: params[:supplier])
      @food_business = FoodBusiness.find_by(id: params[:food_business])
      # redirect_to(conversations_path) and return unless (@supplier && @food_business)
      @conversation = Conversation.where(food_business_id: @food_business.id, supplier_id: @supplier.id).first
    else
      @conversation = Conversation.find_by(id: params[:conversation_id])
      # redirect_to(conversations_path) and return unless @conversation
      #  && @conversation.participates?(current_user)
    end
  end
end

