describe 'create connection endpoint' do
  before(:each) do
    @user = User.create!({id: 1, name: 'Mary', email: 'ml@email.com',  password_digest: 'password', mentor: false})

    Profile.create({ user_id: 1, field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',  gender: 'She/Her',
      image: 'https://ca.slack-edge.com/T029P2S9M-UKFAC39T8-a2bcff612d11-72' })

    Location.create( {user_id: 1, city: 'Boulder',  state: 'CO', zip_code: '80202',  meetup_radius: '20' })

    @mentor = User.create!({id: 2, name: 'Kayla', email: 'kw@email.com', password_digest: 'password', mentor: true })

    Profile.create({ user_id: 2,field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',
      gender: 'She/Her', image: 'https://ca.slack-edge.com/T029P2S9M-UKDBXCVSR-c9dfc59451e1-72' })

    MentorProfile.create({ user_id: 2,   field_of_knowledge: 'Software Development', experience_level: 'Intermediate',
      work_day_question: 'My typical day is awesome!', enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
      teaching_points_question: 'I want to teach React Native!', advice_question: 'Just keep swimming!'} )

    Location.create({user_id: 2,   city: 'Denver', state: 'CO', zip_code: '90210', meetup_radius: '15' })

    Connection.create(mentee_id: @user.id, mentor_id: @mentor.id)
  end
  it 'destroys a connection' do
    query_string = <<-GRAPHQL
      mutation {
        destroyConnection(input: {
          menteeEmail: "ml@email.com"
          mentorEmail: "kw@email.com"
        }) {
          message
        }
      }
    GRAPHQL

    post '/api/v1/graphql', params: { query: query_string }

    result = JSON.parse(response.body)
    expect(result["data"]["destroyConnection"]["message"]).to eq('connection destroyed')
    expect(Connection.all.length).to eq(0)
  end
  it 'cannot delete connection without valid emails' do
    query_string = <<-GRAPHQL
      mutation {
        destroyConnection(input: {
          menteeEmail: "foofoo@gmail.com"
          mentorEmail: "lala@email.com"
        }) {
          message
        }
      }
    GRAPHQL

    post '/api/v1/graphql', params: { query: query_string }

    result = JSON.parse(response.body)
    expect(Connection.all.length).to eq(1)
    expect(result["data"]["destroyConnection"]["message"]).to eq("connection not destroyed")
  end
end
