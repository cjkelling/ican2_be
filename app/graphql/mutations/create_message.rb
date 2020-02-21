class Mutations::CreateMessage < Mutations::BaseMutation

  argument :conversation_id, String, required: true
  argument :body, String, required: true
  argument :user_id, String, required: true

  field :message, String, null: false
  field :errors, [String], null: false

  def resolve(conversation_id:, body:, user_id:)
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
      {
        message: nil,
        errors: 'Message not created'
      }
    end
  end
end
