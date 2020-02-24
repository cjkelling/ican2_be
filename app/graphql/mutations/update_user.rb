require 'date'

class Mutations::UpdateUser < Mutations::BaseMutation

  argument :name, String, required: false
  argument :email, String, required: false
  argument :password_digest, String, required: false
  argument :mentor, Boolean, required: false

  argument :gender, String, required: false
  argument :about_me, String, required: false
  argument :image, String, required: false
  argument :field_of_interest, String, required: false

  argument :field_of_knowledge, String, required: false
  argument :experience_level, String, required: false
  argument :work_day_question, String, required: false
  argument :enjoyment_question, String, required: false
  argument :teaching_points_question, String, required: false
  argument :advice_question, String, required: false

  argument :city, String, required: false
  argument :state, String, required: false
  argument :zip_code, String, required: false
  argument :meetup_radius, Int, required: false

  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(name: nil, email: nil, password_digest: nil, mentor: nil,

                  gender: nil, about_me: nil, image: nil, field_of_interest: nil,

                  field_of_knowledge: nil, experience_level: nil,
                  work_day_question: nil, enjoyment_question: nil,
                  teaching_points_question: nil, advice_question: nil,

                  city: nil, state: nil, zip_code: nil, meetup_radius: nil)


    user_info = { name: name, email: email, password_digest: password_digest, mentor: mentor}

    profile_info = { gender: gender, about_me: about_me, image: image,
                    field_of_interest: field_of_interest}

    mentor_info = { field_of_knowledge: field_of_knowledge, experience_level: experience_level,
                   work_day_question: work_day_question, enjoyment_question: enjoyment_question,
                   teaching_points_question: teaching_points_question, advice_question: advice_question }

    location_info = { city: city, state: state, zip_code: zip_code, meetup_radius: meetup_radius}

    user_info.select! {|k,v| v != nil }
    profile_info.select! {|k,v| v != nil }
    mentor_info.select! {|k,v| v != nil }
    location_info.select! {|k,v| v != nil }

    User.update_user_and_info(user_info, profile_info, mentor_info, location_info)
    user = User.find_by(email: user_info[:email])
    if user.updated?(user_info, profile_info, mentor_info, location_info)
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
