module Types
  class MutationType < Types::BaseObject
    field :create_connection, mutation: Mutations::CreateConnection
    field :create_conversation, mutation: Mutations::CreateConversation
    field :create_user, mutation: Mutations::CreateUser
    field :create_message, mutation: Mutations::CreateMessage
    field :destroy_connection, mutation: Mutations::DestroyConnection
    field :destroy_message, mutation: Mutations::DestroyMessage
    field :destroy_user, mutation: Mutations::DestroyUser
    field :update_user, mutation: Mutations::UpdateUser
  end
end
