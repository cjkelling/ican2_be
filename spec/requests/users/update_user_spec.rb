describe 'update user endpoint' do
  before(:each) do
    @mentor = User.create!({id: 1, name: 'Mary', email: 'ml@email.com',  password_digest: 'password', mentor: true, address: 'Boulder, CO'})

    Profile.create({ user_id: 1, field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',  gender: 'She/Her',
      image: 'https://ca.slack-edge.com/T029P2S9M-UKFAC39T8-a2bcff612d11-72' })


    MentorProfile.create({ user_id: 1, field_of_knowledge: 'Software Development',  experience_level: 'Advanced',
      work_day_question: 'My typical day is awesome!', enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
      teaching_points_question: 'I want to teach Ruby on Rails!', advice_question: 'Just keep swimming!' })


    @user = User.create!({id: 2, name: 'Kayla', email: 'kw@email.com', password_digest: 'password', mentor: false, address: 'Denver, CO'})

    Profile.create({ user_id: 2, field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',
      gender: 'She/Her', image: 'https://ca.slack-edge.com/T029P2S9M-UKDBXCVSR-c9dfc59451e1-72' })
  end
  it 'updates a user ' do
    query_string = <<-GRAPHQL
    mutation {
      updateUser(input: {
        name: "May"
        email: "ml@email.com"
        mentor: false
        address: "Denver, CO"
      }) {
        user {
          name
          mentor
        }
        errors
      }
    }
    GRAPHQL

    post '/api/v1/graphql', params: { query: query_string }

    result = JSON.parse(response.body)
    expect(result["data"]["updateUser"]["user"]["name"]).to eq('May')
    expect(result["data"]["updateUser"]["user"]["mentor"]).to eq(false)
    expect(@mentor.location.address).to eq('Denver, CO')
    expect(@mentor.mentor_profile).to be_nil
  end
  it 'can update user to mentor' do
    query_string = <<-GRAPHQL
    mutation {
      updateUser(input: {
        email: "kw@email.com"
        mentor: true
        fieldOfKnowledge: "Software Development"
        experienceLevel: "Intermediate"
        workDayQuestion: "My typical day is awesome!"
        enjoymentQuestion: "I enjoy teaching and sharing my knowledge!"
        teachingPointsQuestion: "I want to teach React Native!"
        adviceQuestion: "Just keep swimming!"
       }) {
        user {
          name
          mentor
        }
        errors
      }
    }
    GRAPHQL

    post '/api/v1/graphql', params: { query: query_string }

    result = JSON.parse(response.body)
    expect(result["data"]["updateUser"]["user"]["mentor"]).to eq(true)
    expect(@user.mentor_profile.field_of_knowledge).to eq('Software Development')
  end
end
