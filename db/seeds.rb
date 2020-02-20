User.destroy_all
Profile.destroy_all
Location.destroy_all
MentorProfile.destroy_all
Connection.destroy_all
Conversation.destroy_all
Message.destroy_all

mentee = User.create!(
  name: 'Christopher',
  email: 'ck@email.com',
  password: 'password',
  mentor: false )

Profile.create!(
  age: 31,
  gender: 'He/Him',
  about_me: 'I want to learn more about software development.',
  image: 'https://ca.slack-edge.com/T029P2S9M-UK4P0D42W-08ba1d31a7f6-72',
  field_of_interest: 'Software Development',
  user_id: mentee.id)

Location.create!(
  city: 'Northglenn',
  state: 'CO',
  zip_code: '80233',
  meetup_radius: '25',
  user_id: mentee.id)

mentor = User.create!(
  name: 'Mary',
  email: 'ml@email.com',
  password: 'password',
  mentor: true )

Profile.create!(
  age: 27,
  gender: 'She/Her',
  about_me: 'I want to learn more about software development.',
  image: 'https://ca.slack-edge.com/T029P2S9M-UKFAC39T8-a2bcff612d11-72',
  field_of_interest: 'Software Development',
  user_id: mentor.id)

Location.create!(
  city: 'Boulder',
  state: 'CO',
  zip_code: '80021',
  meetup_radius: '20',
  user_id: mentor.id)

MentorProfile.create!(
  field_of_knowledge: 'Software Development',
  experience_level: 'Advanced',
  work_day_question: 'My typical day is awesome!',
  enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
  teaching_points_question: 'I want to teach Ruby on Rails!',
  advice_question: 'Just keep swimming!',
  user_id: mentor.id)

mentor2 = User.create!(
  name: 'Kayla',
  email: 'kw@email.com',
  password: 'password',
  mentor: true )

Profile.create!(
  age: 28,
  gender: 'She/Her',
  about_me: 'I want to learn more about software development.',
  image: 'https://ca.slack-edge.com/T029P2S9M-UKDBXCVSR-c9dfc59451e1-72',
  field_of_interest: 'Software Development',
  user_id: mentor2.id)

Location.create!(
  city: 'Denver',
  state: 'CO',
  zip_code: '80004',
  meetup_radius: '15',
  user_id: mentor2.id)

MentorProfile.create!(
  field_of_knowledge: 'Software Development',
  experience_level: 'Intermediate',
  work_day_question: 'My typical day is awesome!',
  enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
  teaching_points_question: 'I want to teach React Native!',
  advice_question: 'Just keep swimming!',
  user_id: mentor2.id)

mentor3 = User.create!(
  name: 'Ben',
  email: 'bf@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  age: 26,
  gender: 'He/Him',
  about_me: 'I want to learn more about software development.',
  image: 'https://ca.slack-edge.com/T029P2S9M-UK28AK7FD-4caa1e486b61-72',
  field_of_interest: 'Software Development',
  user_id: mentor3.id)

Location.create!(
  city: 'Golden',
  state: 'CO',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor3.id)

MentorProfile.create!(
  field_of_knowledge: 'Software Development',
  experience_level: 'Beginner',
  work_day_question: 'My typical day is awesome!',
  enjoyment_question: 'I enjoy teaching and sharing my knowledge!',
  teaching_points_question: 'I want to teach Javascript!',
  advice_question: 'Just keep swimming!',
  user_id: mentor3.id)

Connection.create!(
  mentee_id: mentee.id,
  mentor_id: mentor.id
)

Connection.create!(
  mentee_id: mentee.id,
  mentor_id: mentor2.id
)

Connection.create!(
  mentee_id: mentee.id,
  mentor_id: mentor3.id
)

conversation = Conversation.create!(
  sender_id: mentee.id,
  recipient_id: mentor.id
)

Conversation.create!(
  sender_id: mentee.id,
  recipient_id: mentor2.id
)

Conversation.create!(
  sender_id: mentee.id,
  recipient_id: mentor3.id
)

Message.create!(
  body: "Hello. I would like you to mentor me.",
  conversation_id: conversation.id,
  user_id: mentee.id
)

Message.create!(
  body: "Hello. I would be happy to mentor you!",
  conversation_id: conversation.id,
  user_id: mentor.id
)
