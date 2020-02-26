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
  gender: 'He/Him',
  about_me: 'I want to learn more about software development. I am changing careers and looking to grow my foundation. I am really interested in Ruby.',
  image: 'https://i.imgur.com/w3GRLBt.jpg',
  field_of_interest: 'Software Development',
  user_id: mentee.id)

Location.create!(
  city: 'Northglenn',
  state: 'Colorado',
  zip_code: '80233',
  meetup_radius: '25',
  user_id: mentee.id)

mentee2 = User.create!(
  name: 'Laura',
  email: 'ls@email.com',
  password: 'password',
  mentor: false )

Profile.create!(
  gender: 'She/Her',
  about_me: 'I want to learn more about botany. I grew up taking care of greenhouses. I want to continue to garden and grow my own food.',
  image: 'https://i.imgur.com/GcHaQVp.jpg',
  field_of_interest: 'Botany',
  user_id: mentee2.id)

Location.create!(
  city: 'Brooklyn',
  state: 'New York',
  zip_code: '10221',
  meetup_radius: '25',
  user_id: mentee2.id)

mentee3 = User.create!(
  name: 'Rachel',
  email: 'rl@email.com',
  password: 'password',
  mentor: false )

Profile.create!(
  gender: 'She/Her',
  about_me: 'I want to learn more about education. I have always dreamed of being a teacher. I hope to teach science to high school students.',
  image: 'https://i.imgur.com/9jm780n.jpg',
  field_of_interest: 'Education',
  user_id: mentee3.id)

Location.create!(
  city: 'West Hollywood',
  state: 'California',
  zip_code: '90231',
  meetup_radius: '25',
  user_id: mentee3.id)

mentee4 = User.create!(
  name: 'Nick',
  email: 'nn@email.com',
  password: 'password',
  mentor: false )

Profile.create!(
  gender: 'He/Him',
  about_me: 'I want to learn more about integrated art. I love art of all kinds and want to learn ideas and techniques for bringing them together. My favorite combination is digital art with water colors.',
  image: 'https://i.imgur.com/sUKEnrf.jpg',
  field_of_interest: 'Art',
  user_id: mentee4.id)

Location.create!(
  city: 'Doral',
  state: 'Florida',
  zip_code: '90231',
  meetup_radius: '25',
  user_id: mentee4.id)

mentee5 = User.create!(
  name: 'Foster',
  email: 'ft2@email.com',
  password: 'password',
  mentor: false )

Profile.create!(
  gender: 'He/Him',
  about_me: 'I want to learn more about transformational theory in music. I grew up playing piano and guitar. My goals include PhD in music theory and teaching collegiate level music courses.',
  image: 'https://i.imgur.com/du2rUvk.jpg',
  field_of_interest: 'Music',
  user_id: mentee5.id)

Location.create!(
  city: 'Round Rock',
  state: 'Texas',
  zip_code: '90231',
  meetup_radius: '25',
  user_id: mentee5.id)

mentor = User.create!(
  name: 'Mary',
  email: 'ml@email.com',
  password: 'password',
  mentor: true )

Profile.create!(
  gender: 'She/Her',
  about_me: 'I want to grow my career in software development. I enjoy solving complex problems and taking on new challenges. My foundation is in Ruby on Rails.',
  image: 'https://i.imgur.com/EZFb38Y.jpg',
  field_of_interest: 'Software Development',
  user_id: mentor.id)

Location.create!(
  city: 'Boulder',
  state: 'Colorado',
  zip_code: '80021',
  meetup_radius: '20',
  user_id: mentor.id)

MentorProfile.create!(
  field_of_knowledge: 'Software Development',
  experience_level: 'Advanced',
  work_day_question: 'My typical day is interspersed between code reviews, developing features, meetings, and pair programming. I make an effort to speak to teammates about eachothers progress everyday. In any spare time I continue certifications for new frameworks.',
  enjoyment_question: 'I enjoy writing code and working with others to work through tough code. I also enjoy meetings and retrospectives where we can reflect and improve on our processes.',
  teaching_points_question: 'I want to teach Ruby on Rails as well as help students looking to solve challenge problems found on resources such as Code Wars, Leetcode, and Exercism.',
  advice_question: 'Make sure you are coding every day. There are great tutorials and workshops all around. If you are ever looking for something new to learn check out meetups!',
  user_id: mentor.id)

mentor2 = User.create!(
  name: 'Kayla',
  email: 'kw@email.com',
  password: 'password',
  mentor: true )

Profile.create!(
  gender: 'She/Her',
  about_me: 'I am looking to advance my capabilities in front end design. My goals are to incorporate interactive augmented reality applications to classroom environments. I have been successful in carrying through my teaching experience in my coding career and intend to continue.',
  image: 'https://i.imgur.com/xZ6ZMc5.jpg',
  field_of_interest: 'Software Development',
  user_id: mentor2.id)

Location.create!(
  city: 'Denver',
  state: 'Colorado',
  zip_code: '80004',
  meetup_radius: '15',
  user_id: mentor2.id)

MentorProfile.create!(
  field_of_knowledge: 'Software Development',
  experience_level: 'Intermediate',
  work_day_question: 'My typical day is creative as well as complex. Front end technology evolves quickly. I must always keep on top of new tech and show that I can implement and test it well.',
  enjoyment_question: 'I enjoy making beautiful applications that serve a need in society. I love incorporating new tech into my applications and working in the forefront of web development.',
  teaching_points_question: 'I want to teach React Native along with React Hooks. I also have a strong foundation with javascript and would enjoy helping anyone looking to develop js skills.',
  advice_question: 'Check out modern websites and their tech. Use your favorite sites for design inspiration. Remember to check out open source code bases for new implementations or new ideas.',
  user_id: mentor2.id)

mentor3 = User.create!(
  name: 'Ben',
  email: 'bf@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'He/Him',
  about_me: 'I want to develop design skills for outdoor websites. I am an experienced climber and avid coder. My passions combine for exciting new apps to help people find the best gear and spots in Colorado.',
  image: 'https://i.imgur.com/dhqysma.jpg',
  field_of_interest: 'Software Development',
  user_id: mentor3.id)

Location.create!(
  city: 'Golden',
  state: 'Colorado',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor3.id)

MentorProfile.create!(
  field_of_knowledge: 'Software Development',
  experience_level: 'Beginner',
  work_day_question: 'My work day is flexible. I am able to manage my work as it suits me. I am able to incorporate climbing into my everyday and get my work done.',
  enjoyment_question: 'I enjoy applying coding to my areas of interest to build interactive and resourceful applications for those interested in the outdoors. I love exploring new tools and frameworks and making them work for the task at hand.',
  teaching_points_question: 'I would love to teach javascript along with css, as well as react native with enzyme and jest. I like to incorporate project based learning and help others grow by building things.',
  advice_question: 'Check out projects online you can try to recreate on your own, or add to. There are great resources for open source code as well you can reference and be a part of.',
  user_id: mentor3.id)

mentor4 = User.create!(
  name: 'Alice',
  email: 'ap@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'She/Her',
  about_me: 'I want to learn about bonsai trees. I have tended plants my whole life. I love the exotic look of the bonsai and want to have a garden featuring different varieties.',
  image: 'https://i.imgur.com/jIQ3bwo.jpg',
  field_of_interest: 'Botany',
  user_id: mentor4.id)

Location.create!(
  city: 'New York',
  state: 'New York',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor4.id)

MentorProfile.create!(
  field_of_knowledge: 'Botany',
  experience_level: 'Intermediate',
  work_day_question: 'My typical day is busy caring for plants and tending to needs of the grounds. I spend a majority of my day developing fertilizers and implementing new water filtration and distribution systems. ',
  enjoyment_question: 'I enjoy teaching through workshops, showing others the proper techniques and environments for different kinds of plants to grow in. I also have tours of my greenhouses where I discuss all the plants and their needs.',
  teaching_points_question: 'I want to teach soil health, fertilization techniques, and water distribution. I enjoy teaching others how to nurture plant life at home and often ask students to send progress updates.',
  advice_question: 'Doing research for your type of plant is vital. Make sure you are prepared with the right resources and environment for what you are trying to do.',
  user_id: mentor4.id)

mentor5 = User.create!(
  name: 'John',
  email: 'jt@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'He/Him',
  about_me: 'I want to learn about japanese peace lily. I have enjoyed gardening since I was young, flowers are my favorite focus in botany for their beauty and their transience.',
  image: 'https://i.imgur.com/T94KQRm.jpg',
  field_of_interest: 'Botany',
  user_id: mentor5.id)

Location.create!(
  city: 'Brooklyn',
  state: 'New York',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor5.id)

MentorProfile.create!(
  field_of_knowledge: 'Botany',
  experience_level: 'Advanced',
  work_day_question: 'Every day I tend to plants and research new plants I can grow. I experiment with gene editing for combining plant traits and procuring favorable attributes for optimal health and longevity.',
  enjoyment_question: 'I enjoy researching new plant life. The expanse of organisms is vast, I enjoy discovering exotic plants and achieving the right conditions in which they can grow.',
  teaching_points_question: 'I want to teach about all the different kinds of plants, plant genetics, and lab techniques for gene editing.',
  advice_question: 'Research is paramount. Having a strong science background is very helpful, especially in the lab environment.',
  user_id: mentor5.id)

mentor6 = User.create!(
  name: 'Ryan',
  email: 'rh@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'He/Him',
  about_me: 'I want to learn about orchids. All the variety of orchid and tending to them will is something I intend to master. I have been working with them since my teen years.',
  image: 'https://i.imgur.com/DA6STdb.jpg',
  field_of_interest: 'Botany',
  user_id: mentor6.id)

Location.create!(
  city: 'Bronx',
  state: 'New York',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor6.id)

MentorProfile.create!(
  field_of_knowledge: 'Botany',
  experience_level: 'Advanced',
  work_day_question: 'My days are a combindation of exploratory reading and collaboration with colleagues as well as hands on with the plants in our fields.',
  enjoyment_question: 'I enjoy collaborative environments and group learning. I enjoy the hands on work with plants and the joy and beauty of sustaining them.',
  teaching_points_question: 'I want to teach orchid care, as well as teach on the varieties and their needs. I love group workshop activities where students can freely ask questions.',
  advice_question: 'Visit gardens that inspire you. Traveling can be such a great tool for discovering new plants. I recommend keeping a personal garden always.',
  user_id: mentor6.id)

mentor7 = User.create!(
  name: 'Michael',
  email: 'mc@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'He/Him',
  about_me: 'I want to learn about higher education, reaching into collegiate level courses and post graduate work as well.',
  image: 'https://i.imgur.com/54CfFWn.jpg',
  field_of_interest: 'Education',
  user_id: mentor7.id)

Location.create!(
  city: 'Los Angeles',
  state: 'California',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor7.id)

MentorProfile.create!(
  field_of_knowledge: 'Education',
  experience_level: 'Advanced',
  work_day_question: 'I work with students currently at the college level teaching writing courses. I very much focus on written evaluations and group discussion.',
  enjoyment_question: 'I enjoy seeing great writing from my students, and seeing their improvements over time. My greatest joy is having a student be published. ',
  teaching_points_question: 'I enjoy working with students to develop their voice as a writer. I focus on being eloquent but also to the point while taking your reader through your story.',
  advice_question: 'I encourage students to have others read their work. Continous reading is mandatory to learn and be inspired by different patterns and techniques.',
  user_id: mentor7.id)

mentor8 = User.create!(
  name: 'Heather',
  email: 'hf@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'She/Her',
  about_me: 'I want to learn about engagement strategies in the classroom. I have taught younger age students for many years, I truly believe our roles as instructors is to facilitate self discovery.',
  image: 'https://i.imgur.com/gtXB6E4.jpg',
  field_of_interest: 'Education',
  user_id: mentor8.id)

Location.create!(
  city: 'Los Angeles',
  state: 'California',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor8.id)

MentorProfile.create!(
  field_of_knowledge: 'Education',
  experience_level: 'Advanced',
  work_day_question: 'My days are very busy. My time in the classroom demands all of my attention and resources. Outside of classroom time I develop lesson plans and procure resources to help students in need.',
  enjoyment_question: 'I enjoy seeing students engaged in class. My goal is for all of my students to always be asking questions. I want to see my students reach their full potential.',
  teaching_points_question: 'I want to teach classroom strategy and planning. I have found that you can never be too prepared. I would love to work with anyone developing new lesson plans or new to the teaching field.',
  advice_question: 'Practice what you teach. Remember every class and every individual is unique. They are teaching you just as much as you are teaching them.',
  user_id: mentor8.id)

mentor9 = User.create!(
  name: 'Trisha',
  email: 'tl@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'She/Her',
  about_me: 'I want to learn about classroom management and enforcement principles in the academic environment. I want to be able to have an organized and respectful classroom that also inspires engagement. ',
  image: 'https://i.imgur.com/9Fce70A.jpg',
  field_of_interest: 'Education',
  user_id: mentor9.id)

Location.create!(
  city: 'Santa Monica',
  state: 'California',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor9.id)

MentorProfile.create!(
  field_of_knowledge: 'Education',
  experience_level: 'Intermediate',
  work_day_question: 'My days are very demanding. My time in the classroom is all-consuming. I take time outside of class to review student work and prepare future lessons.',
  enjoyment_question: 'I enjoy seeing students grow, and knowing I was able to help them on their way. My proudest moments are seeing students graduate to their next step ready to take on new challenges.',
  teaching_points_question: 'I would love to work with anyone new to teaching looking to develop their identity as a teacher. I also work with teachers on discipline management skills.',
  advice_question: 'Always keep evolving your lesson plans. Students will always sense a stagnant routine. Attend conferences and speak with colleagues for advice and inspiration.',
  user_id: mentor9.id)

mentor10 = User.create!(
  name: 'Fenton',
  email: 'ft@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'He/Him',
  about_me: 'I want to learn about hybrid learning. There are many growing resources to be utilized that reach students on many different levels.',
  image: 'https://i.imgur.com/bEEHRuL.png',
  field_of_interest: 'Education',
  user_id: mentor10.id)

Location.create!(
  city: 'Torrance',
  state: 'California',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor10.id)

MentorProfile.create!(
  field_of_knowledge: 'Education',
  experience_level: 'Advanced',
  work_day_question: 'I teach very focused courses that take up most of my day. In free time I read new material on my subjects and meet with students for office hours to discuss concepts and challenges.',
  enjoyment_question: 'I enjoy building relationships and helping others find their best way to learn. I also enjoy finding new ways of reaching students that focus on building their skills overall rather than through a test based system.',
  teaching_points_question: 'I want to teach restorative justice, and how it can revolutionize our education system. I believe all students should be seen and treated with dignity and respect, and that the punitive approach does nothing but bring more harm.',
  advice_question: 'Its about them. Remember what you are fighting for as an educator. We have the power to impact change in the lives of our students. I have heard many people reference a great instructor as their reason for success and hope to be that for my own students.',
  user_id: mentor10.id)

mentor11 = User.create!(
  name: 'Scott',
  email: 'se@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'He/Him',
  about_me: 'I want to learn about conceptual art, creating pieces that focus more on the why and how. The greatest pieces are those that provoke the most questions.',
  image: 'https://i.imgur.com/BX6ot7r.jpg',
  field_of_interest: 'Art',
  user_id: mentor11.id)

Location.create!(
  city: 'Miami',
  state: 'Florida',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor11.id)

MentorProfile.create!(
  field_of_knowledge: 'Art',
  experience_level: 'Advanced',
  work_day_question: 'My typical day is creative and messy. My routine can change day to day. I produce at least 2 new works every month.',
  enjoyment_question: 'I enjoy creating beautifil work that inspires thought. I look to friends and family to see their discussion around it that can inspire my next creations.',
  teaching_points_question: 'I want to teach craftsmanship and innovation. True art takes mastery as well as an individual point of view. I believe the greatest beauty on earth comes from the power of individuality.',
  advice_question: 'Find the message you would like to send in your work, find your voice. Your feelings and experienes are those unique gems that can be expressed only as you know how in physical form.',
  user_id: mentor11.id)

mentor12 = User.create!(
  name: 'Dustin',
  email: 'dm@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'He/Him',
  about_me: 'I want to learn about 3D graphics for creating art as well as implementing three dimensional environments in video games',
  image: 'https://i.imgur.com/sByfoZz.jpg',
  field_of_interest: 'Art',
  user_id: mentor12.id)

Location.create!(
  city: 'Hialeah',
  state: 'Florida',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor12.id)

MentorProfile.create!(
  field_of_knowledge: 'Art',
  experience_level: 'Beginner',
  work_day_question: 'I spend my days playing with graphics on the computer and trying to create new models and designs. I have meetings to review work and collaborate with others in the field from time to time.',
  enjoyment_question: 'I enjoy advancing the way we use technology for gaming and art. I love creating things that feel real or alive. I enjoy creating games that create a true 3D experience.',
  teaching_points_question: 'I want to graphic art to anyone new to the field. I like working on projects with others and doing workshops to inspire new ideas.',
  advice_question: 'Think outside the box, and keep up with the tech. New ideas are constantly evolving, and tech is evolving faster and faster. Find what you want to create from within.',
  user_id: mentor12.id)

mentor13 = User.create!(
  name: 'Allie',
  email: 'am@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'She/Her',
  about_me: 'I want to learn about algorithmic art. I have always enjoyed math and pattern making. My passion for art allows me to explore these concepts with a creative edge.',
  image: 'https://i.imgur.com/7FXwEWV.jpg',
  field_of_interest: 'Art',
  user_id: mentor13.id)

Location.create!(
  city: 'Homestead',
  state: 'Florida',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor13.id)

MentorProfile.create!(
  field_of_knowledge: 'Art',
  experience_level: 'Intermediate',
  work_day_question: 'I work on pieces for art shows as well as creating art for private auction. I spend most of my time in the studio as well as exploring digital tools.',
  enjoyment_question: 'I enjoy exploring the formation attractive pieces that hook into the human penchant for patterns. I love making math beautiful and fun.',
  teaching_points_question: 'I want to teach pixel art and using software to expand the creative palette. I particularly enjoy fractal art',
  advice_question: 'Nature can be one of the greatest sources of inspiration for patterns. Be sure to learn the technologies available for generating algorithms and have an understanding of software.',
  user_id: mentor13.id)

mentor14 = User.create!(
  name: 'David',
  email: 'dl@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'He/Him',
  about_me: 'I want to learn about jazz, its origins as well as its influence on modern music. I am a trumpet player and hope to evolve my abilities to be able to play in concert',
  image: 'https://i.imgur.com/98gB79D.jpg',
  field_of_interest: 'Music',
  user_id: mentor14.id)

Location.create!(
  city: 'Austin',
  state: 'Texas',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor14.id)

MentorProfile.create!(
  field_of_knowledge: 'Music',
  experience_level: 'Intermediate',
  work_day_question: 'My typical day is full of practice. I focus on tough solos and improvisation techniques as well as group performing.',
  enjoyment_question: 'I enjoy piecing together music and math, and how bending those rules in jazz can make great music. I love feeling the rhythm and creating unique sounds.',
  teaching_points_question: 'I want to teach young trumpet players the fundamentals of jazz playing. The unqiue sounds, patterns and intonations all come together to form a truly unique perspective.',
  advice_question: 'Being confident and comfortable allows for true improvisation. Be sure to practice on your own as well as practicing blending your sound with others.',
  user_id: mentor14.id)

mentor15 = User.create!(
  name: 'Brian',
  email: 'bb@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'He/Him',
  about_me: 'I want to learn about classical music and how I can truly reach mastery. I want to tie in classical concepts to more modern music as well.',
  image: 'https://i.imgur.com/Ov6ZG3L.jpg',
  field_of_interest: 'Music',
  user_id: mentor15.id)

Location.create!(
  city: 'San Antonio',
  state: 'Texas',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor15.id)

MentorProfile.create!(
  field_of_knowledge: 'Music',
  experience_level: 'Intermediate',
  work_day_question: 'I spend a lot of my day in studio practicing. I search for new music and constantly makes recordings to study my patterns and sounds.',
  enjoyment_question: 'I enjoy the therapy of sound, how I can express true meaning through music. I love tying different genres together and creating something new.',
  teaching_points_question: 'I want to teach guitar from the classical perspective. I like to have sessions where I play with the student and also where they sight read new pieces.',
  advice_question: 'Practice',
  user_id: mentor15.id)

mentor16 = User.create!(
  name: 'Raisa',
  email: 'rp@email.com',
  password: 'password',
  mentor: true)

Profile.create!(
  gender: 'She/Her',
  about_me: 'I want to learn about set theory in music, how objects can be organized and related to one another. I want to master sets and permutations.',
  image: 'https://i.imgur.com/WFYMk3Q.jpg',
  field_of_interest: 'Music',
  user_id: mentor16.id)

Location.create!(
  city: 'San Marcos',
  state: 'Texas',
  zip_code: '80132',
  meetup_radius: '10',
  user_id: mentor16.id)

MentorProfile.create!(
  field_of_knowledge: 'Music',
  experience_level: 'Advanced',
  work_day_question: 'I spend some time studying theory and the other half of my time putting it into practice.',
  enjoyment_question: 'I enjoy finding patterns and groupings in music but also how I can create new and unique sounds by combining different sets of components.',
  teaching_points_question: 'Anyone new to music or looking to learn a new instrument please reach out. I would love working with new musicians to develop your sound and music reading abilities.',
  advice_question: 'Practice practice! Solo challenge pieces as well as group playing are a great way to explore your skills. Try different kinds of pieces that focus on different concepts',
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
