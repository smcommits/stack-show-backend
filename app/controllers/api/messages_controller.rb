# frozen_string_literal: true

module Api
  class MessagesController < ApplicationController
    before_action :authenticate_user!

    def create
      message = Message.new(message_params)
      conversation = Conversation.find(message_params[:conversation_id])

      if message.save!
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
          MessageSerializer.new(message)
        ).serializable_hash
        MessagesChannel.broadcast_to conversation, serialized_data
        head :ok
      end
    end

    private

    def message_params
      params.require(:params).permit(:text, :conversation_id, :user_id)
    end
  end
end
