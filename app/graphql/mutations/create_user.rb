class Mutations::CreateUser < Mutations::BaseMutation

  argument :name, String, required: true
  argument :email, String, required: true
  argument :password_digest, String, required: true
  argument :mentor, Boolean, required: true


  argument :age, Int, required: true
  argument :gender, String, required: true
  argument :about_me, String, required: true
  argument :image, String, required: true
  argument :field_of_interest, String, required: true

  argument :field_of_knowledge, String, required: false
  argument :experience_level, String, required: false
  argument :work_day_question, String, required: false
  argument :enjoyment_question, String, required: false
  argument :teaching_points_question, String, required: false
  argument :advice_question, String, required: false

  argument :city, String, required: true
  argument :state, String, required: true
  argument :zip_code, String, required: true
  argument :meetup_radius, Int, required: false

  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(name:, email:, password_digest:, mentor:,

                  age:, gender:, about_me:, image:, field_of_interest:,

                  field_of_knowledge: nil, experience_level: nil,
                  work_day_question: nil, enjoyment_question: nil,
                  teaching_points_question: nil, advice_question: nil,

                  city:, state:, zip_code:, meetup_radius: nil)


    user_info = { name: name, email: email, password_digest: password_digest, mentor: mentor}

    profile_info = { age: age, gender: gender, about_me: about_me, image: image,
                    field_of_interest: field_of_interest}

    mentor_info = { field_of_knowledge: field_of_knowledge, experience_level: experience_level,
                   work_day_question: work_day_question, enjoyment_question: enjoyment_question,
                   teaching_points_question: teaching_points_question, advice_question: advice_question }

    location_info = { city: city, state: state, zip_code: zip_code, meetup_radius: meetup_radius}

    User.create_user_and_info(user_info, profile_info, mentor_info, location_info)

    if User.last.email == user_info[:email]
      user = User.last
      {
         user: user,
         errors: [],
       }
    else
      {
        user: nil,
        errors: user.errors.full_messages
      }
    end
  end

end
