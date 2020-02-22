class Mutations::UpdateMessage < Mutations::BaseMutation
  argument :id, String, required: true
  argument :read, String, required: true

  field :message, Types::MessageType, null: false
  field :errors, String, null: false

  def resolve(id:, read:)
    message_read = { read: read }
    message = Message.find_by(id: id)
    if message
      message.update(message_read)
      if message.read == true
        {
           message: message,
           errors: [],
        }
      end
    else
      {
        message: nil,
        errors: "Message not found"
      }
    end
  end
end
