# ican2

![ican2](https://i.imgur.com/QaqyvqP.png?1)

### Description

ican2 is a Rails GraphQL API serving queries for a PostgreSQL database comprised of users who can have connections to each other in the form of mentee to mentor. These connections are also able to have conversations and messages sent between the two users.

### Tech Stack
* Rails (5.2.4)
* GraphQL (1.10.3)
* RSpec (3.9.0
* PostgreSQL (11.5)

### Links

BackEnd Repo: [here](https://github.com/cjkelling/ican2_be)

FrontEnd Repo: 

BackEnd Heroku :  Find our heroku app [here](https://ican2-be-rails.herokuapp.com/)

FrontEnd Heroku : Find our front end app [here]

## Getting Started

### Install necessary dependencies

*Note: This project is built on Rails. For more information about installing Rails, see [here](https://guides.rubyonrails.org/v5.0/getting_started.html).*

Instal necessary dependencies using `bundle install`
To generate rspec files: `rails generate rspec:install`


### Set up local database

This project uses a PostgreSQL database. Database names are specified in the database.yml To create, migrate and seed run the following commands:
`rails db:create`
`rails db:migrate`
`rails db:seed`

### Running local server

To run locally, simply use the command `rails server` or `rails s` for short.

### Testing

With rspec installed the simply command `rspec` will run the entire test suite
Tests can be run singularly by running `rspec` followed by the test file path\

## Deploying to Heroku

Create a heroku app with a PostgreSQL add-on. Set your heroku remote to your heroku app.
`git push heroku master`
`heroku run rake db:migrate`
`heroku run rake db:seed`
`heroku open`

## Endpoints

Being a grahpql api we have one endpoint to serve all requests, that endpoint being:

`/api/v1/graphql`

### Requests Formats
<details> 
  <summary>***Get a single user with name and email attributes:***</summary>

POST request to `/api/v1/graphql`

Headers: 

`{ 'Content-Type': 'application/json' } `

Body: 

```
    query($email: String!) {
       users(email: $email) {
        name
        email
        mentor
       profile {
            gender
            aboutMe
            image
            fieldOfInterest
        }
        mentorProfile {
          fieldOfKnowledge
          experienceLevel
          workDayQuestion
          enjoymentQuestion
          teachingPointsQuestion
          adviceQuestion
        }
        location {
          city
          state
        }
      }
    }
```
    
Response: 

```
{
    "data": {
        "users": {
            "name": "Kayla",
            "email": "kw@email.com",
            "mentor": true,
            "profile": {
                "gender": "She/Her",
                "aboutMe": "I want to learn more about software development.",
                "image": "https://i.imgur.com/xZ6ZMc5.jpg",
                "fieldOfInterest": "Software Development"
            },
            "mentorProfile": {
                "fieldOfKnowledge": "Software Development",
                "experienceLevel": "Intermediate",
                "workDayQuestion": "My typical day is awesome!",
                "enjoymentQuestion": "I enjoy teaching and sharing my knowledge!",
                "teachingPointsQuestion": "I want to teach React Native!",
                "adviceQuestion": "Just keep swimming!"
            },
            "location": {
                "city": "Denver",
                "state": "CO"
            }
        }
    }
}
```
</details>

<details>
  <summary>***Get all mentors with name city and state:***</summary>

POST request to `/api/v1/graphql`

Headers:

`{ 'Content-Type': 'application/json' } `

Body: 

`{ "query": "mentors": { "name" "location" { "city" "state" } } }`

Response: 

```
{
    "data": {
        "mentors": [
            {
                "name": "Mary",
                "email": "ml@email.com",
                "location": {
                    "city": "Boulder",
                    "state": "CO"
                }
            },
            {
                "name": "Kayla",
                "email": "kw@email.com",
                "location": {
                    "city": "Denver",
                    "state": "CO"
                }
            },
            {
                "name": "Ben",
                "email": "bf@email.com",
                "location": {
                    "city": "Golden",
                    "state": "CO"
                }
            },
            {
                "name": "Alice",
                "email": "ap@email.com",
                "location": {
                    "city": "New York",
                    "state": "NY"
                }
            },
            {
                "name": "John",
                "email": "jt@email.com",
                "location": {
                    "city": "Brooklyn",
                    "state": "NY"
                }
            },
            {
                "name": "Ryan",
                "email": "rh@email.com",
                "location": {
                    "city": "Bronx",
                    "state": "NY"
                }
            },
            {
                "name": "Michael",
                "email": "mc@email.com",
                "location": {
                    "city": "Los Angeles",
                    "state": "CA"
                }
            },
            {
                "name": "Heather",
                "email": "hf@email.com",
                "location": {
                    "city": "Los Angeles",
                    "state": "CA"
                }
            },
            {
                "name": "Trisha",
                "email": "tl@email.com",
                "location": {
                    "city": "Santa Monica",
                    "state": "CA"
                }
            },
            {
                "name": "Fenton",
                "email": "ft@email.com",
                "location": {
                    "city": "Torrance",
                    "state": "CA"
                }
            },
            {
                "name": "Scott",
                "email": "se@email.com",
                "location": {
                    "city": "Miami",
                    "state": "FL"
                }
            },
            {
                "name": "Dustin",
                "email": "dm@email.com",
                "location": {
                    "city": "Hialeah",
                    "state": "FL"
                }
            },
            {
                "name": "Allie",
                "email": "am@email.com",
                "location": {
                    "city": "Homestead",
                    "state": "FL"
                }
            },
            {
                "name": "David",
                "email": "dl@email.com",
                "location": {
                    "city": "Austin",
                    "state": "TX"
                }
            },
            {
                "name": "Brian",
                "email": "bb@email.com",
                "location": {
                    "city": "San Antonio",
                    "state": "TX"
                }
            },
            {
                "name": "Raisa",
                "email": "rp@email.com",
                "location": {
                    "city": "San Marcos",
                    "state": "TX"
                }
            },
            {
                "name": "mmmvmvm",
                "email": "mvmvmvm@.mm",
                "location": {
                    "city": "Alamosa",
                    "state": "Colorado"
                }
            },
            {
                "name": "bruce",
                "email": "bg@email.com",
                "location": {
                    "city": "Abbeville",
                    "state": "Alabama"
                }
            },
            {
                "name": "WhittiB",
                "email": "Kardashian@stayyoung.net",
                "location": {
                    "city": "Avon-by-the-Sea",
                    "state": "New Jersey"
                }
            },
            {
                "name": "Pepper",
                "email": "pep@meow.com",
                "location": {
                    "city": "Aetna",
                    "state": "Arkansas"
                }
            },
            {
                "name": "Pep",
                "email": "meow@pep.com",
                "location": {
                    "city": "A and F Trailer Park",
                    "state": "Arizona"
                }
            },
            {
                "name": "name",
                "email": "email@.",
                "location": {
                    "city": "Acebedo",
                    "state": "California"
                }
            },
            {
                "name": "avas",
                "email": "dva",
                "location": {
                    "city": "Abco",
                    "state": "Arkansas"
                }
            },
            {
                "name": "Travis",
                "email": "tr@email.com",
                "location": {
                    "city": "Byers",
                    "state": "Colorado"
                }
            }
        ]
    }
}
```
</details> 

***Get all conversations by user_id:***

POST request to `/api/v1/graphql`

Headers: 

`{ 'Content-Type': 'application/json' } `

Body:  

`{ "query": "conversations("user_id")": { "id" "senderId" "recipientId" } }`

***Get a single conversation by sender and recipient id:***

POST request to `/api/v1/graphql`

Headers: 

`{ 'Content-Type': 'application/json' } `

Body:  

`{ "query": "messages("sender", "recipient")": { "body" "read"} }`

<details> 
  <summary>***Create a user by entering wanted profile information:***</summary>

POST request to `/api/v1/graphql`

Headers: 

`{ 'Content-Type': 'application/json' } `

Body:  

```
    mutation {
      createUser(input: {
        name: "Matt",
        email: "me@mattboldt.com"
        passwordDigest: "lalala"
        mentor: true
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
```
    
Response:
    
```
{
    "data": {
        "createUser": {
            "user": {
                "id": 45,
                "name": "Matt",
                "email": "mooshoofoo@mattboldt.com",
                "mentor": true,
                "profile": {
                    "gender": "Male",
                    "aboutMe": "I love vegetables",
                    "image": "this is an image string",
                    "fieldOfInterest": "Software"
                },
                "mentorProfile": {
                    "fieldOfKnowledge": "Software Development",
                    "experienceLevel": "Intermediate",
                    "workDayQuestion": "My typical day is awesome!",
                    "enjoymentQuestion": "I enjoy teaching and sharing my knowledge!",
                    "teachingPointsQuestion": "I want to teach React Native!",
                    "adviceQuestion": "Just keep swimming!"
                },
                "location": {
                    "city": "Denver",
                    "state": "CO"
                }
            },
            "errors": []
        }
    }
}
```
</details> 

<details>
  <summary>***Create a connection between mentor and mentee by their emails:***</summary>

POST request to `/api/v1/graphql`

Headers:

`{ 'Content-Type': 'application/json' } `

Body:  

`{ "query": "createConnection("menteeEmail", "mentorEmail")": { "message"} }`

</details>

<details>
  <summary>***Create a conversation and message between mentor and mentee by their ids:***</summary>

POST request to `/api/v1/graphql`

Headers:

`{ 'Content-Type': 'application/json' } `

Body:  

`{ "query": "createConversation("senderId", "recipientId")": { "message"} }`

</details>

<details>
  <summary>***Update a user by modifying their profile data:***</summary>

POST request to `/api/v1/graphql`

Headers: 

`{ 'Content-Type': 'application/json' } `

Body:  

`{ "query": "updateUser("city", "state", "zipCode")": { "city" "state" "zip"} }`

</details>

<details>
  <summary>***Update a message from unread to read:***</summary>

POST request to `/api/v1/graphql`

Headers: 

`{ 'Content-Type': 'application/json' } `

Body:  

`{ "query": "updateMessage("read")": { "read" } }`

</details>

<details>
  <summary>***Destroy a user by their emails:***</summary>

POST request to `/api/v1/graphql`

Headers: 

`{ 'Content-Type': 'application/json' } `

Body:  

`{ "query": "destroyUser("email")": { "message" } }`

</details>

<details>
  <summary>***Destroy a connection by mentor and mentee email:***</summary>

POST request to `/api/v1/graphql`

Headers: 

`{ 'Content-Type': 'application/json' } `

Body: 

`{ "query": "destroyConnection("menteeEmail" "mentorEmail")": { "message" } }`
</details>

<details>
  <summary>***Destroy a message by the message id:***</summary>

POST request to `/api/v1/graphql`

Headers:

`{ 'Content-Type': 'application/json' } `

Body:  

`{ "query": "destroyMessage("id")": { "message" } }`
</details>

### Response Format

***Example Format:***
  {
    data: {
      methodNameCalled: {
        modelTypeAffected: {
          attributesReturned
        }
        errors: []
      }
    }
  }

***Actual updateUser Response:***
  {
    "data": {
      "updateUser": {
        "user": {
          "name": "May",
          "mentor": false
        },
        "errors": []
      }
    }
  }

### Database Schema

![Database Schema](https://i.imgur.com/634n5KS.png)

### Project Board

[GitHub Project Board](https://github.com/mcat56/ican2_BE/projects/1)

### Core Contributors

Mary Lang @mcat56

Christopher Kelling @cjkelling
