User.destroy_all
Profile.destroy_all
MentorProfile.destroy_all
Connection.destroy_all
Conversation.destroy_all
Message.destroy_all

mentee = User.create!(
  name: 'Christopher',
  email: 'ck@email.com',
  password: 'password',
  address: 'Northglenn, CO',
  mentor: false )

Profile.create!(
  gender: 'He/Him',
  about_me: 'I want to learn more about software development.',
  image: 'https://files.slack.com/files-pri/T029P2S9M-FUETZAD7Y/ck.jpeg',
  field_of_interest: 'Software Development',
  user_id: mentee.id)


mentor = User.create!(
  name: 'Mary',
  email: 'ml@email.com',
  address: 'Boulder, CO',
  password: 'password',
  mentor: true )

Profile.create!(
  gender: 'She/Her',
  about_me: 'I want to learn more about software development.',
  image: 'https://files.slack.com/files-pri/T029P2S9M-FUCMTHR40/ml.jpeg',
  field_of_interest: 'Software Development',
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
  address: 'Denver, CO',
  email: 'kw@email.com',
  password: 'password',
  mentor: true )

Profile.create!(
  gender: 'She/Her',
  about_me: 'I want to learn more about software development.',
  image: 'https://files.slack.com/files-pri/T029P2S9M-FU2JAPQ1X/kw.jpeg',
  field_of_interest: 'Software Development',
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
  address: 'Golden, CO',
  email: 'bf@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'He/Him',
  about_me: 'I want to learn more about software development.',
  image: 'https://files.slack.com/files-pri/T029P2S9M-FUC8FL7LL/bf.jpeg',
  field_of_interest: 'Software Development',
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
