module Types
  class ConversationType < Types::BaseObject
    field :id, Int, null: false
    field :sender_id, Int, null: false
    field :recipient_id, Int, null: false
  end
end
