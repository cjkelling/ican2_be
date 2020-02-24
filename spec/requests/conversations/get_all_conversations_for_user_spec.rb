describe 'Get Conversation Messages' do
  before(:each) do
    @mentee = User.create!({id: 1, name: 'Mary', email: 'ml@email.com',  password_digest: 'password', mentor: false })
    Profile.create({ user_id: 1, field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',  gender: 'She/Her',
      image: 'https://ca.slack-edge.com/T029P2S9M-UKFAC39T8-a2bcff612d11-72' })
    Location.create( {user_id: 1, city: 'Boulder',  state: 'CO', zip_code: '80202',  meetup_radius: '20' })

    @mentor = User.create!({id: 4, name: 'Kayla', email: 'kw@email.com', password_digest: 'password', mentor: true })
    Profile.create({ user_id: 4,field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',
      gender: 'She/Her', image: 'https://ca.slack-edge.com/T029P2S9M-UKDBXCVSR-c9dfc59451e1-72' })
    MentorProfile.create!({ user_id: 4,   field_of_knowledge: 'Software Development', experience_level: 'Intermediate',
      work_day_question: 'My typical day is awesome!', enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
      teaching_points_question: 'I want to teach React Native!', advice_question: 'Just keep swimming!'} )
    Location.create!({user_id: 4,   city: 'Denver', state: 'CO', zip_code: '90210', meetup_radius: '15' })

    @mentor2 = User.create!({id: 2, name: 'Christopher', email: 'ck@email.com', password_digest: 'password', mentor: true })

    Profile.create({ user_id: 2,field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',
      gender: 'He/Him', image: 'https://ca.slack-edge.com/T029P2S9M-UKDBXCVSR-c9dfc59451e1-72' })

    MentorProfile.create({ user_id: 2,   field_of_knowledge: 'Software Development', experience_level: 'Intermediate',
      work_day_question: 'My typical day is awesome!', enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
      teaching_points_question: 'I want to teach React Native!', advice_question: 'Just keep swimming!'} )

    Location.create({user_id: 2,   city: 'Denver', state: 'CO', zip_code: '90210', meetup_radius: '15' })


    @mentor3 = User.create!({id: 3, name: 'Ben', email: 'bf@email.com', password_digest: 'password',  mentor: true })

    Profile.create({ user_id: 3, field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',
                    gender: 'He/Him', image: 'https://ca.slack-edge.com/T029P2S9M-UK28AK7FD-4caa1e486b61-72' })

    MentorProfile.create({user_id: 3, field_of_knowledge: 'Software Development', experience_level: 'Beginner',
    work_day_question: 'My typical day is awesome!', enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
    teaching_points_question: 'I want to teach Javascript!', advice_question: 'Just keep swimming!' })

    Location.create({user_id: 3,   city: 'Golden', state: 'CO', zip_code: '90302', meetup_radius: '10' })

    @conversation = Conversation.create!(sender_id: @mentee.id, recipient_id: @mentor.id)
    @conversation1 = Conversation.create!(sender_id: @mentee.id, recipient_id: @mentor2.id)
    @conversation2 = Conversation.create!(sender_id: @mentee.id, recipient_id: @mentor3.id)

    Message.create!(
      body: "Hello. I would like you to mentor me.",
      read: true,
      conversation_id: @conversation.id,
      user_id: @mentee.id
    )

    Message.create!(
      body: "Hello. I would be happy to mentor you!",
      conversation_id: @conversation.id,
      user_id: @mentor.id
    )

    Message.create!(
      body: "Hello. You could be my second mentor!",
      read: true,
      conversation_id: @conversation1.id,
      user_id: @mentee.id
    )

    Message.create!(
      body: "Hello. Sure!",
      conversation_id: @conversation1.id,
      user_id: @mentor2.id
    )

    Message.create!(
      body: "Hello. You could be my third mentor!",
      read: true,
      conversation_id: @conversation2.id,
      user_id: @mentee.id
    )

    Message.create!(
      body: "Hello. Three times a charm!",
      conversation_id: @conversation2.id,
      user_id: @mentor3.id
    )
  end
  it 'sends message info' do
    query_string = <<-GRAPHQL
      query($userId: String!) {
        conversations(userId: $userId){
          id
          senderId
          recipientId
        }
      }
    GRAPHQL

    post '/api/v1/graphql', params: { query: query_string, variables: { userId: @mentee.id }}

    result = JSON.parse(response.body)
    expect(result["data"]["conversations"].length).to eq(3)
  end
end
