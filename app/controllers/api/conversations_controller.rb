class Api::ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    conversations = Conversation.all
    render json: conversations
  end

  def create
    conversation = Conversation.new(title: params[:title])

    if conversation.save
      ownership1 = UserConversation.new
      ownership1.conversation_id = conversation.id
      ownership1.user_id = params[:sender_id]
      ownership1.save!

      ownership2 = UserConversation.new
      ownership2.conversation_id = conversation.id
      ownership2.user_id = params[:reciever_id]
      ownership2.save!

      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ConversationSerializer.new(conversation)
      ).serializable_hash

      ActionCable.server.broadcast(
        "current_user_#{current_user.id}",
        serialized_data
      )

      ActionCable.server.broadcast(
        "current_user_#{params[:reciever_id]}",
        serialized_data
      )

      head :ok
    end
  end
end
