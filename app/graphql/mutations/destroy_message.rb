class Mutations::DestroyMessage < Mutations::BaseMutation
  argument :id, String, required: true

  field :message, String, null: false
  field :errors, [String], null: false

  def resolve(id:)
    message = Message.find_by(id: id)

    if message != nil && message.destroy
      {
         message: 'Message has been successfully deleted',
         errors: [],
       }
    else
      {
        message: nil,
        errors: 'Message not found'
      }
    end
  end
end
