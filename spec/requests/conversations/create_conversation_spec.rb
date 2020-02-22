describe 'create connection' do
  before(:each) do
    @user = User.create!({id: 1, name: 'Mary', email: 'ml@email.com',  password_digest: 'password', mentor: false, address: 'Boulder, CO' })
    Profile.create({ user_id: 1, field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',  gender: 'She/Her',
      image: 'https://ca.slack-edge.com/T029P2S9M-UKFAC39T8-a2bcff612d11-72' })

    @mentor = User.create!({id: 2, name: 'Kayla', email: 'kw@email.com', password_digest: 'password', mentor: true, address: 'Denver, CO' })
    Profile.create({ user_id: 2, field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',
      gender: 'She/Her', image: 'https://ca.slack-edge.com/T029P2S9M-UKDBXCVSR-c9dfc59451e1-72' })
    MentorProfile.create({ user_id: 2,   field_of_knowledge: 'Software Development', experience_level: 'Intermediate',
      work_day_question: 'My typical day is awesome!', enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
      teaching_points_question: 'I want to teach React Native!', advice_question: 'Just keep swimming!'} )
  end

  it 'creates a conversation' do
    query_string = <<-GRAPHQL
      mutation {
        createConversation(input: {
          senderId: "#{@user.id}"
          recipientId: "#{@mentor.id}"
        })  {
          message
        }
      }
    GRAPHQL

    post '/api/v1/graphql', params: { query: query_string }

    result = JSON.parse(response.body)

    expect(Conversation.all.length).to eq(1)
    expect(result["data"]["createConversation"]["message"]).to eq('Conversation created successfully!')
  end

  it 'cannot create conversation with invalid user id' do
    query_string = <<-GRAPHQL
      mutation {
        createConversation(input: {
          senderId: "88"
          recipientId: "99"
        })  {
          message
        }
      }
    GRAPHQL


    post '/api/v1/graphql', params: { query: query_string }

    result = JSON.parse(response.body)

    expect(Conversation.all.length).to eq(0)
    expect(result["errors"][0]["message"]).to eq("Cannot return null for non-nullable field CreateConversation.message")
  end
end
