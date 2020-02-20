describe 'create user endpoint' do
  it 'creates a new user ' do
    query_string = <<-GRAPHQL
    mutation {
      createUser(input: {
        name: "Matt",
        email: "me@mattboldt.com"
        passwordDigest: "lalala"
        mentor: false
        age: 29
        gender: "Male"
        fieldOfInterest: "Software"
        aboutMe: "I love vegetables"
        image: "this is an image string"
        city: "Denver"
        state: "CO"
        zipCode: "90210"
      }) {
        user {
          id
          name
          email
        }
        errors
      }
    }
    GRAPHQL

    post '/api/v1/graphql', params: { query: query_string }

    result = JSON.parse(response.body)
    user = User.last
    expect(Location.last.user_id).to eq(user.id)
    expect(Profile.last.user_id).to eq(user.id)
    expect(MentorProfile.all.length).to eq(0)
    expect(user.name).to eq('Matt')
    expect(result["data"]["createUser"]["user"]["name"]).to eq('Matt')
  end
  it 'creates a new user who is a mentor' do
    query_string = <<-GRAPHQL
    mutation {
      createUser(input: {
        name: "Matt",
        email: "me@mattboldt.com"
        passwordDigest: "lalala"
        mentor: true
        age: 29
        gender: "Male"
        fieldOfInterest: "Software"
        aboutMe: "I love vegetables"
        image: "this is an image string"
        city: "Denver"
        state: "CO"
        zipCode: "90210"
        fieldOfKnowledge: "Software Development"
        experienceLevel: "Intermediate"
        workDayQuestion: "My typical day is awesome!"
        enjoymentQuestion: "I enjoy teaching and sharing my knowledge!"
        teachingPointsQuestion: "I want to teach React Native!"
        adviceQuestion: "Just keep swimming!"
      }) {
        user {
          id
          name
          email
        }
        errors
      }
    }
    GRAPHQL

    post '/api/v1/graphql', params: { query: query_string }

    result = JSON.parse(response.body)
    user = User.last
    expect(result["data"]["createUser"]["user"]["name"]).to eq('Matt')
    expect(Location.last.user_id).to eq(user.id)
    expect(Profile.last.user_id).to eq(user.id)
    expect(MentorProfile.last.user_id).to eq(user.id)
  end
  it 'cannot create user without all necessary fields' do
    query_string = <<-GRAPHQL
    mutation {
      createUser(input: {
        name: "Matt",
        email: "me@mattboldt.com"
        passwordDigest: "lalala"
        mentor: false
        gender: "Male"
        fieldOfInterest: "Software"
        aboutMe: "I love vegetables"
        image: "this is an image string"
        state: "CO"
        zipCode: "90210"
      }) {
        user {
          id
          name
          email
        }
        errors
      }
    }
    GRAPHQL

    post '/api/v1/graphql', params: { query: query_string, variables: { email: 'foofoo@gmail.com' }}

    result = JSON.parse(response.body)
    expect(result["errors"].length).to eq(2)
    expect(result["errors"][0]["message"]).to eq("Argument 'age' on InputObject 'CreateUserInput' is required. Expected type Int!")
    expect(result["errors"][1]["message"]).to eq("Argument 'city' on InputObject 'CreateUserInput' is required. Expected type String!")
  end
end
