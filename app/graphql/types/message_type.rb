module Types
  class MessageType < Types::BaseObject
    field :id, Int, null: false
    field :user_id, Int, null: false
    field :body, String, null: false
    field :conversation, Types::ConversationType, null: false
    field :read, Boolean, null: false
  end
end
