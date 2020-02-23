class Mutations::CreateMessage < Mutations::BaseMutation
  argument :body, String, required: true
  argument :user_id, String, required: true
  argument :conversation_id, String, required: false
  argument :sender_id, String, required: false
  argument :recipient_id, String, required: false

  field :message, String, null: false
  field :errors, [String], null: false

  def resolve(conversation_id: nil, sender_id: nil, recipient_id: nil, body:, user_id:)
    conversation = Conversation.find_by(id: conversation_id)
    if conversation
      message = Message.new(conversation_id: conversation_id, body: body, user_id: user_id)
      if message.save
        {
           message: 'Message created successfully!',
           errors: [],
         }
      else
        {
          message: nil,
          errors: message.errors.full_messages
        }
      end
    else
      conversation = Conversation.new(sender_id: sender_id, recipient_id: recipient_id)
      if conversation.save
        message = Message.new(conversation_id: conversation.id, body: body, user_id: user_id)
        if message.save
          {
             message: 'Message created successfully!',
             errors: [],
          }
        end
      else
        {
          message: nil,
          errors: 'Message not created'
        }
      end
    end
  end
end
