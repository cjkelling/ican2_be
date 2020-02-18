module Types
  class QueryType < Types::BaseObjec
    field :mentors, [Types::UserType], null: false  do
      argument :location, String, required: false
      argument :gender, String, required: false
      argument :field, String, required: false
      argument :expert_lvl, String, required: false
    end

    def mentors(location: nil, gender: nil, field: nil, expert_lvl: nil)
      User.get_all_mentors({location: location, gender: gender, field: field, expert_lvl: expert_lvl})
    end

    field :users, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def users(id:)
      User.get_user(id)
    end

  end
end
