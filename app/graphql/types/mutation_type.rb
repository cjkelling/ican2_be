module Types
  class MutationType < Types::BaseObject
    field :destroy_connection, mutation: Mutations::DestroyConnection
    field :create_user, mutation: Mutations::CreateUser   
    field :destroy_user, mutation: Mutations::DestroyUser
    field :update_user, mutation: Mutations::UpdateUser
  end
end
