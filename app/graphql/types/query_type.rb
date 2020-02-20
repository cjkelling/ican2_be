module Types
  class QueryType < Types::BaseObject
    field :mentors, [Types::UserType], null: false  do
      argument :location, String, required: false
      argument :gender, String, required: false
      argument :field, String, required: false
      argument :expert_lvl, String, required: false
    end

    def mentors(location: nil, gender: nil, field: nil, expert_lvl: nil)
      User.get_all_mentors({location: location, gender: gender, field: field, expert_lvl: expert_lvl})
    end

    field :users, Types::UserType, null: false do
      argument :email, String, required: true
    end

    def users(email:)
      User.get_user(email)
    end

    field :conversations, Types::ConversationType, null: false do
      argument :sender, String, required: true
      argument :recipient, String, required: true
    end

    def conversations(sender:, recipient:)
      Conversation.conversations(sender.to_i, recipient.to_i)
    end

    field :messages, Types::MessageType, null: false do
      argument :sender, String, required: true
      argument :recipient, String, required: true
    end

    def messages(sender:, recipient:)
      response = Message.messages(Conversation.conversations(sender.to_i, recipient.to_i))
    end
  end
end
