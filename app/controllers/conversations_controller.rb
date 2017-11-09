class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show]

  def index
    if params[:food_business]
      @conversations = Conversation.where(food_business_id: params[:food_business]).order('updated_at DESC')
    else
      @conversations = Conversation.where(supplier_id: params[:supplier]).order('updated_at DESC')
    end      
  end

  def show
    @food_business = params[:food_business]
    @supplier = params[:supplier]
    if current_user.supplier
      @receiver = @conversation.food_business.business_name
    else
      @receiver = @conversation.supplier.business_name
    end 
    @message = Message.new
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end
end