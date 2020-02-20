module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_connection, mutation: Mutations::CreateConnection
    field :destroy_connection, mutation: Mutations::DestroyConnection	
    field :destroy_user, mutation: Mutations::DestroyUser	
    field :update_user, mutation: Mutations::UpdateUser	
  end
end
