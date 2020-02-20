module Types
  class MessageType < Types::BaseObject
    field :id, Int, null: false
    field :sender_id, Int, null: false
    field :recipient_id, Int, null: false
    field :body, String, null: false
    field :read, Boolean, null: false
  end
end
