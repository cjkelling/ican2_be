describe 'destroy user endpoint' do
  before(:each) do
    @mentor = User.create!({id: 1, name: 'Mary', email: 'ml@email.com',  password_digest: 'password', mentor: true})

    Profile.create({ user_id: 1, field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',  gender: 'She/Her',
      image: 'https://ca.slack-edge.com/T029P2S9M-UKFAC39T8-a2bcff612d11-72' })


    MentorProfile.create({ user_id: 1, field_of_knowledge: 'Software Development',  experience_level: 'Advanced',
      work_day_question: 'My typical day is awesome!', enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
      teaching_points_question: 'I want to teach Ruby on Rails!', advice_question: 'Just keep swimming!' })

    Location.create( {user_id: 1, city: 'Boulder',  state: 'CO', zip_code: '80202',  meetup_radius: '20' })
  end
  it 'sends user info' do
    query_string = <<-GRAPHQL
    mutation {
      destroyUser(input: {
        email: "ml@email.com"
      }) {
        message
      }
    }
    GRAPHQL

    post '/api/v1/graphql', params: { query: query_string }

    result = JSON.parse(response.body)
    expect(result["data"]["destroyUser"]["message"]).to eq("successful deletion")
    expect(User.all.length).to eq(0)
    expect(Location.all.length).to eq(0)
    expect(MentorProfile.all.length).to eq(0)
    expect(Profile.all.length).to eq(0)
  end
  it 'returns nil for a user query with invalid email' do
    query_string = <<-GRAPHQL
    mutation {
      destroyUser(input: {
        email: "foofoo@gmail.com"
      }) {
        message
      }
    }
    GRAPHQL

    post '/api/v1/graphql', params: { query: query_string }

    result = JSON.parse(response.body)

    expect(result["errors"][0]["message"]).to eq("Cannot return null for non-nullable field DestroyUser.message")
    expect(User.all.length).to eq(1)
    expect(Location.all.length).to eq(1)
    expect(MentorProfile.all.length).to eq(1)
    expect(Profile.all.length).to eq(1)

  end
end
