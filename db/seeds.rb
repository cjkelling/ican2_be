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
  image: 'https://i.imgur.com/w3GRLBt.jpg',
  field_of_interest: 'Software Development',
  user_id: mentee.id)

Location.create!(
  city: 'Northglenn',
  state: 'CO',
  zip_code: '80233',
  meetup_radius: '25',
  user_id: mentee.id)

mentee2 = User.create!(
  name: 'Laura',
  email: 'ls@email.com',
  password: 'password',
  mentor: false )

Profile.create!(
  age: 31,
  gender: 'She/Her',
  about_me: 'I want to learn more about botany.',
  image: 'https://i.imgur.com/GcHaQVp.jpg',
  field_of_interest: 'Botany',
  user_id: mentee2.id)

Location.create!(
  city: 'Brooklyn',
  state: 'NY',
  zip_code: '10221',
  meetup_radius: '25',
  user_id: mentee2.id)

mentee3 = User.create!(
  name: 'Rachel',
  email: 'rl@email.com',
  password: 'password',
  mentor: false )

Profile.create!(
  age: 31,
  gender: 'She/Her',
  about_me: 'I want to learn more about education.',
  image: 'https://i.imgur.com/9jm780n.jpg',
  field_of_interest: 'Education',
  user_id: mentee3.id)

Location.create!(
  city: 'West Hollywood',
  state: 'CA',
  zip_code: '90231',
  meetup_radius: '25',
  user_id: mentee3.id)

mentee4 = User.create!(
  name: 'Nick',
  email: 'nn@email.com',
  password: 'password',
  mentor: false )

Profile.create!(
  age: 31,
  gender: 'He/Him',
  about_me: 'I want to learn more about integrated art',
  image: 'https://i.imgur.com/sUKEnrf.jpg',
  field_of_interest: 'Art',
  user_id: mentee4.id)

Location.create!(
  city: 'Doral',
  state: 'FL',
  zip_code: '90231',
  meetup_radius: '25',
  user_id: mentee4.id)

mentee5 = User.create!(
  name: 'Foster',
  email: 'ft2@email.com',
  password: 'password',
  mentor: false )

Profile.create!(
  age: 31,
  gender: 'He/Him',
  about_me: 'I want to learn more about transformational theory',
  image: 'https://i.imgur.com/du2rUvk.jpg',
  field_of_interest: 'Music',
  user_id: mentee5.id)

Location.create!(
  city: 'Round Rock',
  state: 'TX',
  zip_code: '90231',
  meetup_radius: '25',
  user_id: mentee5.id)

mentor = User.create!(
  name: 'Mary',
  email: 'ml@email.com',
  password: 'password',
  mentor: true )

Profile.create!(
  age: 27,
  gender: 'She/Her',
  about_me: 'I want to learn more about software development.',
  image: 'https://i.imgur.com/EZFb38Y.jpg',
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
  image: 'https://i.imgur.com/xZ6ZMc5.jpg',
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
  image: 'https://i.imgur.com/dhqysma.jpg',
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

mentor4 = User.create!(
  name: 'Alice',
  email: 'ap@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  age: 26,
  gender: 'She/Her',
  about_me: 'I want to learn about bonsai.',
  image: 'https://i.imgur.com/jIQ3bwo.jpg',
  field_of_interest: 'Botany',
  user_id: mentor4.id)

Location.create!(
  city: 'New York',
  state: 'NY',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor4.id)

MentorProfile.create!(
  field_of_knowledge: 'Botany',
  experience_level: 'Intermediate',
  work_day_question: 'My typical day is green!',
  enjoyment_question: 'I enjoy teaching through workshops',
  teaching_points_question: 'I want to teach soil health',
  advice_question: 'Keep planting',
  user_id: mentor4.id)

mentor5 = User.create!(
  name: 'John',
  email: 'jt@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  age: 26,
  gender: 'He/Him',
  about_me: 'I want to learn about japanese peace lily.',
  image: 'https://i.imgur.com/T94KQRm.jpg',
  field_of_interest: 'Botany',
  user_id: mentor5.id)

Location.create!(
  city: 'Brooklyn',
  state: 'NY',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor5.id)

MentorProfile.create!(
  field_of_knowledge: 'Botany',
  experience_level: 'Advanced',
  work_day_question: 'My typical day is wonderful!',
  enjoyment_question: 'I enjoy teaching through workshops',
  teaching_points_question: 'I want to teach succulents',
  advice_question: 'Read books',
  user_id: mentor5.id)

mentor6 = User.create!(
  name: 'Ryan',
  email: 'rh@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  age: 26,
  gender: 'He/Him',
  about_me: 'I want to learn about orchids.',
  image: 'https://i.imgur.com/DA6STdb.jpg',
  field_of_interest: 'Botany',
  user_id: mentor6.id)

Location.create!(
  city: 'Bronx',
  state: 'NY',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor6.id)

MentorProfile.create!(
  field_of_knowledge: 'Botany',
  experience_level: 'Advanced',
  work_day_question: 'My typical day is wonderful!',
  enjoyment_question: 'I enjoy teaching lectures',
  teaching_points_question: 'I want to teach tropical plants',
  advice_question: 'Visit gardens',
  user_id: mentor6.id)

mentor7 = User.create!(
  name: 'Michael',
  email: 'mc@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  age: 26,
  gender: 'He/Him',
  about_me: 'I want to learn about higher education',
  image: 'https://i.imgur.com/54CfFWn.jpg',
  field_of_interest: 'Education',
  user_id: mentor7.id)

Location.create!(
  city: 'Los Angeles',
  state: 'CA',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor7.id)

MentorProfile.create!(
  field_of_knowledge: 'Education',
  experience_level: 'Advanced',
  work_day_question: 'My typical day is fun',
  enjoyment_question: 'I enjoy teaching lectures',
  teaching_points_question: 'I want to teach math and science',
  advice_question: 'Certification courses are helpful',
  user_id: mentor7.id)

mentor8 = User.create!(
  name: 'Heather',
  email: 'hf@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  age: 26,
  gender: 'She/Her',
  about_me: 'I want to learn about engagement strategies',
  image: 'https://i.imgur.com/gtXB6E4.jpg',
  field_of_interest: 'Education',
  user_id: mentor8.id)

Location.create!(
  city: 'Los Angeles',
  state: 'CA',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor8.id)

MentorProfile.create!(
  field_of_knowledge: 'Education',
  experience_level: 'Advanced',
  work_day_question: 'My typical day is busy',
  enjoyment_question: 'I enjoy classroom discussions',
  teaching_points_question: 'I want to teach literature',
  advice_question: 'Practice what you teach',
  user_id: mentor8.id)

mentor9 = User.create!(
  name: 'Trisha',
  email: 'tl@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  age: 26,
  gender: 'She/Her',
  about_me: 'I want to learn about classroom management',
  image: 'https://i.imgur.com/9Fce70A.jpg',
  field_of_interest: 'Education',
  user_id: mentor9.id)

Location.create!(
  city: 'Santa Monica',
  state: 'CA',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor9.id)

MentorProfile.create!(
  field_of_knowledge: 'Education',
  experience_level: 'Intermediate',
  work_day_question: 'My typical day is full of laughter',
  enjoyment_question: 'I enjoy seeing students grow',
  teaching_points_question: 'I want to teach history',
  advice_question: 'Always keep evolving lessons',
  user_id: mentor9.id)

mentor10 = User.create!(
  name: 'Fenton',
  email: 'ft@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  age: 26,
  gender: 'He/Him',
  about_me: 'I want to learn about classroom management',
  image: 'https://i.imgur.com/bEEHRuL.png',
  field_of_interest: 'Education',
  user_id: mentor10.id)

Location.create!(
  city: 'Torrance',
  state: 'CA',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor10.id)

MentorProfile.create!(
  field_of_knowledge: 'Education',
  experience_level: 'Advanced',
  work_day_question: 'My typical day is chaotic',
  enjoyment_question: 'I enjoy building relationships',
  teaching_points_question: 'I want to teach restorative justice',
  advice_question: 'Its about them',
  user_id: mentor10.id)

mentor11 = User.create!(
  name: 'Scott',
  email: 'se@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  age: 26,
  gender: 'He/Him',
  about_me: 'I want to learn about conceptual art',
  image: 'https://i.imgur.com/BX6ot7r.jpg',
  field_of_interest: 'Art',
  user_id: mentor11.id)

Location.create!(
  city: 'Miami',
  state: 'FL',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor11.id)

MentorProfile.create!(
  field_of_knowledge: 'Art',
  experience_level: 'Advanced',
  work_day_question: 'My typical day is creative',
  enjoyment_question: 'I enjoy creating beautifil work',
  teaching_points_question: 'I want to teach craftsmanship',
  advice_question: 'Look for inspiration',
  user_id: mentor11.id)

mentor12 = User.create!(
  name: 'Dustin',
  email: 'dm@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  age: 26,
  gender: 'He/Him',
  about_me: 'I want to learn about 3D graphics',
  image: 'https://i.imgur.com/sByfoZz.jpg',
  field_of_interest: 'Art',
  user_id: mentor12.id)

Location.create!(
  city: 'Hialeah',
  state: 'FL',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor12.id)

MentorProfile.create!(
  field_of_knowledge: 'Art',
  experience_level: 'Beginner',
  work_day_question: 'My typical day is adventurous',
  enjoyment_question: 'I enjoy creating beautifil work',
  teaching_points_question: 'I want to teach dynamic painting',
  advice_question: 'Think outside the box',
  user_id: mentor12.id)

mentor13 = User.create!(
  name: 'Allie',
  email: 'am@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  age: 26,
  gender: 'She/Her',
  about_me: 'I want to learn about algorithmic art',
  image: 'https://i.imgur.com/7FXwEWV.jpg',
  field_of_interest: 'Art',
  user_id: mentor13.id)

Location.create!(
  city: 'Homestead',
  state: 'FL',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor13.id)

MentorProfile.create!(
  field_of_knowledge: 'Art',
  experience_level: 'Intermediate',
  work_day_question: 'My typical day is dynamic',
  enjoyment_question: 'I enjoy exploring new possibilities',
  teaching_points_question: 'I want to teach pixel art',
  advice_question: 'Be true to your inner artist',
  user_id: mentor13.id)

mentor14 = User.create!(
  name: 'David',
  email: 'dl@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  age: 26,
  gender: 'He/Him',
  about_me: 'I want to learn about jazz',
  image: 'https://i.imgur.com/98gB79D.jpg',
  field_of_interest: 'Music',
  user_id: mentor14.id)

Location.create!(
  city: 'Austin',
  state: 'TX',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor14.id)

MentorProfile.create!(
  field_of_knowledge: 'Music',
  experience_level: 'Intermediate',
  work_day_question: 'My typical day is jazzy',
  enjoyment_question: 'I enjoy piecing together music and math',
  teaching_points_question: 'I want to teach trumpet',
  advice_question: 'Be able to improvise',
  user_id: mentor14.id)

mentor15 = User.create!(
  name: 'Brian',
  email: 'bb@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  age: 26,
  gender: 'He/Him',
  about_me: 'I want to learn about classical',
  image: 'https://i.imgur.com/Ov6ZG3L.jpg',
  field_of_interest: 'Music',
  user_id: mentor15.id)

Location.create!(
  city: 'San Antonio',
  state: 'TX',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor15.id)

MentorProfile.create!(
  field_of_knowledge: 'Music',
  experience_level: 'Intermediate',
  work_day_question: 'My typical day is jammin',
  enjoyment_question: 'I enjoy the therapy of sound',
  teaching_points_question: 'I want to teach guitar',
  advice_question: 'Practice',
  user_id: mentor15.id)

mentor16 = User.create!(
  name: 'Raisa',
  email: 'rp@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  age: 26,
  gender: 'She/Her',
  about_me: 'I want to learn about set theory',
  image: 'https://i.imgur.com/WFYMk3Q.jpg',
  field_of_interest: 'Music',
  user_id: mentor16.id)

Location.create!(
  city: 'San Marcos',
  state: 'TX',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor16.id)

MentorProfile.create!(
  field_of_knowledge: 'Music',
  experience_level: 'Advanced',
  work_day_question: 'My typical day is enlightening',
  enjoyment_question: 'I enjoy music theory',
  teaching_points_question: 'I want to teach semiology',
  advice_question: 'Practice',
  user_id: mentor16.id)


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
