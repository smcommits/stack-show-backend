class MessageSerializer < ActiveModel::Serializer
  attributes :id, :coversation_id, :text, :created_at
end
