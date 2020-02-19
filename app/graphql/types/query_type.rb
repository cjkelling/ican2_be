module Types
  class QueryType < Types::BaseObject
    field :mentors, [Types::UserType], null: false  do
      argument :zip_code, String, required: false
      argument :gender, String, required: false
      argument :field, String, required: false
      argument :expert_lvl, String, required: false
    end

    def mentors(zip_code: nil, gender: nil, field: nil, expert_lvl: nil)
      User.get_all_mentors({zip_code: zip_code, gender: gender, field: field, expert_lvl: expert_lvl})
    end

    field :users, Types::UserType, null: false do
      argument :email, String, required: true
    end

    def users(email:)
      User.get_user(email)
    end
  end
end
