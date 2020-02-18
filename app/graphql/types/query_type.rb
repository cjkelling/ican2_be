module Types
  class QueryType < Types::BaseObject
    field :mentors, [Types::UserType], null: false  do
      argument :city, String, required: false
      argument :gender, String, required: false
      argument :field, String, required: false
      argument :expert_lvl, String, required: false
    end

    def mentors(city: nil, gender: nil, field: nil, expert_lvl: nil)
      User.get_all_mentors({city: city, gender: gender, field: field, expert_lvl: expert_lvl})
    end

    field :users, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def users(id:)
      User.get_user(id)
    end
  end
end
