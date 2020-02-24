describe 'get mentors endpoint' do
  before(:each) do
    @user = User.create!({id: 4, name: 'Pheobe', email: 'pb@email.com',  password_digest: 'password', mentor: false, address: 'Golden, CO'})

    Profile.create({ user_id: 4, field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',  gender: 'She/Her',
      image: 'https://ca.slack-edge.com/T029P2S9M-UKFAC39T8-a2bcff612d11-72' })

    @mentor = User.create!({id: 1, name: 'Mary', email: 'ml@email.com',  password_digest: 'password', mentor: true, address: 'Boulder, CO'})

    Profile.create({ user_id: 1, field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',  gender: 'She/Her',
      image: 'https://ca.slack-edge.com/T029P2S9M-UKFAC39T8-a2bcff612d11-72' })


    MentorProfile.create({ user_id: 1, field_of_knowledge: 'Software Development',  experience_level: 'Advanced',
      work_day_question: 'My typical day is awesome!', enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
      teaching_points_question: 'I want to teach Ruby on Rails!', advice_question: 'Just keep swimming!' })


    @mentor2 = User.create!({id: 2, name: 'Kayla', email: 'kw@email.com', password_digest: 'password', mentor: true, address: 'Denver, CO' })

    Profile.create({ user_id: 2, field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',
      gender: 'She/Her', image: 'https://ca.slack-edge.com/T029P2S9M-UKDBXCVSR-c9dfc59451e1-72' })

    MentorProfile.create({ user_id: 2, field_of_knowledge: 'Software Development', experience_level: 'Intermediate',
      work_day_question: 'My typical day is awesome!', enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
      teaching_points_question: 'I want to teach React Native!', advice_question: 'Just keep swimming!'} )


    @mentor3 = User.create!({id: 3, name: 'Ben', email: 'bf@email.com', password_digest: 'password',  mentor: true, address: 'Golden, CO' })

    Profile.create({ user_id: 3, field_of_interest: 'Software Development', about_me: 'I want to learn more about software development.',
                    gender: 'He/Him', image: 'https://ca.slack-edge.com/T029P2S9M-UK28AK7FD-4caa1e486b61-72' })

    MentorProfile.create({user_id: 3, field_of_knowledge: 'Software Development', experience_level: 'Beginner',
    work_day_question: 'My typical day is awesome!', enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
    teaching_points_question: 'I want to teach Javascript!', advice_question: 'Just keep swimming!' })
  end
  it 'sends all mentors by search' do
    query_string = <<-GRAPHQL
      query($email: String!) {
        mentors(email: $email) {
          name
          email
        }
      }
    GRAPHQL


    post '/api/v1/graphql', params: { query: query_string,  variables: { email: "pb@email.com"}}

    result = JSON.parse(response.body)
    expect(result["data"]["mentors"][0]["name"]).to eq('Mary')
    expect(result["data"]["mentors"][1]["name"]).to eq('Kayla')
    expect(result["data"]["mentors"][2]["name"]).to eq('Ben')
  end
  it 'sends all mentors by search with filter such as distance' do
    query_string = <<-GRAPHQL
      query($email: String!, $distance: String!) {
        mentors(email: $email, distance: $distance) {
          name
          email
        }
      }
    GRAPHQL

    post '/api/v1/graphql', params: { query: query_string, variables: { email: "pb@email.com", distance: "10" }}

    result = JSON.parse(response.body)
    expect(result["data"]["mentors"].length).to eq(1)
    expect(result["data"]["mentors"][0]["name"]).to eq('Ben')

  end
  it 'cannot get mentors with invalid search params' do
    query_string = <<-GRAPHQL
      query($email: String!, $animal: String!) {
        mentors(email: $email, animal: $animal) {
          name
          email
        }
      }
    GRAPHQL

    post '/api/v1/graphql', params: { query: query_string, variables: { email: "pb@email.com", animal: "Hippo"}}

    result = JSON.parse(response.body)

    expect(result["errors"][0]["message"]).to eq("Field 'mentors' doesn't accept argument 'animal'")
  end
end
