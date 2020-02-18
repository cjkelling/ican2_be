require 'rails_helper'

describe 'get user endpoint' do
  before(:each) do
    @mentor = User.create!(id: 1, name: 'Mary', email: 'ml@email.com',  password: 'password',
      city: 'Boulder',  state: 'CO', zip_code: '80202',  meetup_radius: '20',  field_of_interest: 'Software Development',
      about_me: 'I want to learn more about software development.',  gender: 'She/Her',
      image: 'https://ca.slack-edge.com/T029P2S9M-UKFAC39T8-a2bcff612d11-72',  mentor: true,
      field_of_knowledge: 'Software Development',  experience_level: 'Advanced',
      work_day_question: 'My typical day is awesome!', enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
      teaching_points_question: 'I want to teach Ruby on Rails!', advice_question: 'Just keep swimming!' )

    @mentor2 = User.create!(id: 2, name: 'Kayla', email: 'kw@email.com', password: 'password',
      city: 'Denver', state: 'CO', zip_code: '90210', meetup_radius: '15', field_of_interest: 'Software Development',
      about_me: 'I want to learn more about software development.', gender: 'She/Her',
      image: 'https://ca.slack-edge.com/T029P2S9M-UKDBXCVSR-c9dfc59451e1-72', mentor: true,
      field_of_knowledge: 'Software Development', experience_level: 'Intermediate',
      work_day_question: 'My typical day is awesome!', enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
      teaching_points_question: 'I want to teach React Native!', advice_question: 'Just keep swimming!' )

    @mentor3 = User.create!(id: 3, name: 'Ben', email: 'bf@email.com', password: 'password',
      city: 'Golden', state: 'CO', zip_code: '90302', meetup_radius: '10', field_of_interest: 'Software Development',
      about_me: 'I want to learn more about software development.',
      gender: 'He/Him', image: 'https://ca.slack-edge.com/T029P2S9M-UK28AK7FD-4caa1e486b61-72',
      mentor: true, field_of_knowledge: 'Software Development', experience_level: 'Beginner',
      work_day_question: 'My typical day is awesome!', enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
      teaching_points_question: 'I want to teach Javascript!', advice_question: 'Just keep swimming!' )
  end
  it 'sends all mentors by search' do
    query_string = <<-GRAPHQL
      query {
        mentors {
          name
          email
        }
      }
    GRAPHQL

    post '/graphql', params: { query: query_string }

    result = JSON.parse(response.body)
    expect(result["data"]["mentors"][0]["name"]).to eq('Mary')
    expect(result["data"]["mentors"][1]["name"]).to eq('Kayla')
    expect(result["data"]["mentors"][2]["name"]).to eq('Ben')
  end
  it 'sends all mentors by search with search params' do
    variables = { "zip_code": "80202"}
    query_string = <<-GRAPHQL
      query($zip_code: String!) {
        mentors($zip_code) {
          name
          email
        }
      }
    GRAPHQL

    post '/graphql', params: { query: query_string, variables: variables}

    result = JSON.parse(response.body)
    require "pry"; binding.pry
  end
end
