class Mutations::DestroyConnection < Mutations::BaseMutation

  argument :mentee_email, String, required: true
  argument :mentor_email, String, required: true

  field :message, String, null: false
  field :errors, [String], null: false

  def resolve(mentee_email:, mentor_email:)
    mentee = User.find_by(email: mentee_email)
    mentor = User.find_by(email: mentor_email)
    if mentor != nil && mentee != nil
      connection = Connection.where({mentee_id: mentee.id, mentor_id: mentor.id}).first
      if connection.destroy
        {
           message: 'connection destroyed',
           errors: [],
         }
      else
        {
          message: 'connection not destroyed',
          errors: ['error in deletion'],
        }
      end
    else
      {
        message: 'connection not destroyed',
        errors: ['users not found'],
      }
    end
  end
end
