class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show]

  def index
    @conversations = Conversation.where(food_business_id: @food_business).order('updated_at DESC')
  end

  def show
    @message = Message.new
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  # def check_participating!
  #   redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  # end

end