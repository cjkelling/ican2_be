module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_user, mutation: Mutations::CreateUser


    field :destroy_connection, mutation: Mutations::DestroyConnection
  end
end
