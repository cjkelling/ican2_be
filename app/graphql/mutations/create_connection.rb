class Mutations::CreateConnection < Mutations::BaseMutation

  argument :mentee_email, String, required: true
  argument :mentor_email, String, required: true

  field :message, String, null: false
  field :errors, [String], null: false

  def resolve(mentee_email:,mentor_email:)
    mentee = User.find_by(email: mentee_email)
    mentor = User.find_by(email: mentor_email)
    if mentee && mentor
      connection = Connection.new(mentee_id: mentee.id, mentor_id: mentor.id)
      if connection.save
        {
           message: 'connection created successfully',
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
        errors: 'Connection not created'
      }
    end
  end
end
