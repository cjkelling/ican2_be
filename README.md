# ican2

![ican2](https://i.imgur.com/QaqyvqP.png?1)

### Description

ican2 is a Rails GraphQL API serving queries for a PostgreSQL database comprised of users who can have connections to each other in the form of mentee to mentor. These connections are also able to have conversations and messages sent between the two users.

### Tech Stack
* Rails (5.2.4)
* GraphQL (1.10.3)
* RSpec (3.9.0
* PostgreSQL (11.5)

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

***Get a single user with name and email attributes:***

POST request to `/api/v1/graphql`

Headers: `{ 'Content-Type': 'application/json' } `

Body:  { "query": "users": { "name" "email" } }

***Get a all mentors with name city and state:***

POST request to `/api/v1/graphql`

Headers: `{ 'Content-Type': 'application/json' } `

Body:  { "query": "mentors": { "name" "city" "state" } }

***Get a all conversations by user_id:***

POST request to `/api/v1/graphql`

Headers: `{ 'Content-Type': 'application/json' } `

Body:  { "query": "conversations("user_id")": { "id" "senderId" "recipientId" } }

***Get a single conversation by sender and recipient id:***

POST request to `/api/v1/graphql`

Headers: `{ 'Content-Type': 'application/json' } `

Body:  { "query": "messages("sender", "recipient")": { "body" "read"} }

***Create a user by entering wanted profile information:***

POST request to `/api/v1/graphql`

Headers: `{ 'Content-Type': 'application/json' } `

Body:  { "query": "createUser("name", "email", "passwordDigest", "mentor", "gender", "fieldOfInterest", "aboutMe", "image", "city", "state", "zipCode", "fieldOfKnowledge", "experienceLevel", "workDayQuestion", "enjoymentQuestion", "teachingPointsQuestion", "adviceQuestion")": { "id" "name" "email"} }

***Create a connection between mentor and mentee by their emails:***

POST request to `/api/v1/graphql`

Headers: `{ 'Content-Type': 'application/json' } `

Body:  { "query": "createConnection("menteeEmail", "mentorEmail")": { "message"} }

***Create a conversation and message between mentor and mentee by their ids:***

POST request to `/api/v1/graphql`

Headers: `{ 'Content-Type': 'application/json' } `

Body:  { "query": "createConversation("senderId", "recipientId")": { "message"} }

***Update a user by modifying their profile data:***

POST request to `/api/v1/graphql`

Headers: `{ 'Content-Type': 'application/json' } `

Body:  { "query": "updateUser("city", "state", "zipCode")": { "city" "state" "zip"} }

***Update a message from unread to read:***

POST request to `/api/v1/graphql`

Headers: `{ 'Content-Type': 'application/json' } `

Body:  { "query": "updateMessage("read")": { "read" } }

***Destroy a user by their emails:***

POST request to `/api/v1/graphql`

Headers: `{ 'Content-Type': 'application/json' } `

Body:  { "query": "destroyUser("email")": { "message" } }

***Destroy a connection by mentor and mentee email:***

POST request to `/api/v1/graphql`

Headers: `{ 'Content-Type': 'application/json' } `

Body:  { "query": "destroyConnection("menteeEmail" "mentorEmail")": { "message" } }

***Destroy a message by the message id:***

POST request to `/api/v1/graphql`

Headers: `{ 'Content-Type': 'application/json' } `

Body:  { "query": "destroyMessage("id")": { "message" } }

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
