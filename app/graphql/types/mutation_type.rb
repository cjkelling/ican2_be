module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_user, mutation: Mutations::CreateUser   
    field :destroy_user, mutation: Mutations::DestroyUser
    field :update_user, mutation: Mutations::UpdateUser
  end
end
