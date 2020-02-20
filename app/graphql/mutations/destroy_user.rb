class Mutations::DestroyUser < Mutations::BaseMutation

  argument :email, String, required: true

  field :message, String, null: false
  field :errors, [String], null: false

  def resolve(email:)
    user = User.find_by(email: email)

    if user != nil && user.destroy
      {
         message: 'successful deletion',
         errors: [],
       }
    else
      {
        user: nil,
        errors: 'user not found'
      }
    end
  end

end
