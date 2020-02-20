![Imgur](https://i.imgur.com/QaqyvqP.png)

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
Tests can be run singularly by running `rspec` followed by the test file path


## Deploying to Heroku

Create a heroku app with a PostgreSQL add-on. Set your heroku remote to your heroku app.
`git push heroku master`
`heroku run rake db:migrate`
`heroku run rake db:seed`
`heroku open`

## Endpoints

Being a grahpql api we have one endpoint to serve all requests, that endpoint being:

`/api/v1/graphql`

### Requests formats

***Get a single user with name and email attributes:*** 

POST request to `/api/v1/graphql` 

Headers: `{ 'Content-Type': 'application/json' } `

Body:  { "query": "users": { "name" "email" } } } 



***Get a all mentors with name city and state:***

POST request to `/api/v1/graphql` 

Headers: `{ 'Content-Type': 'application/json' } `

Body:  { "query": "mentors": { "name" "city" "state" } } } 


### Database Schema 

![Database Schema](https://i.imgur.com/nhLdb4J.png)

### Project Board

[GitHub Project Board](https://github.com/mcat56/ican2_BE/projects/1)

### Core Contributors

Mary Lang @mcat56

Christopher Kelling @cjkelling

