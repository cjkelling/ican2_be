class Mutations::CreateConversation < Mutations::BaseMutation

  argument :sender_id, String, required: true
  argument :recipient_id, String, required: true

  field :message, String, null: false
  field :errors, [String], null: false

  def resolve(sender_id:,recipient_id:)
    sender = User.find_by(id: sender_id)
    recipient = User.find_by(id: recipient_id)
    if sender && recipient
      conversation = Conversation.new(sender_id: sender.id, recipient_id: recipient.id)
      if conversation.save
        {
           message: 'Conversation created successfully!',
           errors: [],
         }
      else
        {
          message: nil,
          errors: connection.errors.full_messages
        }
      end
    else
      {
        message: nil,
        errors: 'Conversation not created.'
      }
    end
  end
end
