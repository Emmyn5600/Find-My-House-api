![](https://img.shields.io/badge/Microverse-blueviolet)

# Project: FIND MY HOUSE API

> This is an API of a frontend mobile web application where you can find a house wherever you are. The API was built using Ruby on Rails.


## Live demo

You can visit the deployed version of the API [this link](https://young-ravine-73545.herokuapp.com/)

## Built With

- Ruby on rails

## Getting Started

To get a local copy up and running follow these simple example steps:

- Clone the repository as indicated by the Setup section below

### Prerequisites

- Text editor
- GitHub
- Git
- ruby
- ruby on rails

### Setup

Clone repository from GitHub to your local drive by following these steps:

- Go to the main page of the repository
- Above the listed files, click the green Code button
- You can clone the repository using:
  - GitHub CLI: gh repo `$ git clone Emmyn5600/Find-My-House-api`.
  - SSH:`$ git clone git@github.com:Emmyn5600/Find-My-House-api.git`.
  - HTTPS:`$ git clone https://github.com/Emmyn5600/Find-My-House-api.git `.
- Open Terminal
- Change the current working directory to the location you want the cloned directory
- Type one of the git clone commands listed above.
- Press Enter to create your local clone
- Remember: Yarn packages need to be installed by running the command <code>yarn install</code> for local setup. Otherwise, the app generates an error.
- Install all the available gems with the command `bundle install`
- Create a database by typing in the terminal <code>rails db:create</code> and then <code>rails db:migrate</code> to define changes to your database schema
- Open your terminal and type <code>rails s</code>. After that join to localhost at `http://localhost:3000/`

### Available Routes

To get access to certain routes the require to be authenticated, please create an account then you will get a token that should be used as the `Authorization` header to access those routes.

   `GET: /houses` -> To get the list of all the available houses, it doesn't require authentication.
    `GET: /houses/1` -> To get a specific house, it doesn't require authentication.
    `POST: /houses `-> To create a house, it requires to be authenticated and have the admin role.
    `DELETE: /houses/1` -> To delete a specific hourse, it requires to be authenticated and have the admin role.
    `GET: /rents/1` -> To get the rent houses for a specific user, it requires to be authenticated.
    `DELETE: /rent/1` -> To delete a specific rent from the favourites table, it requires to be authenticated.
    `GET: /users` -> To get the list of all the users, it requires to be authenticated and have the admin role.
    `GET: /users/1` -> To get a specific user, it requires to be authenticated.
    `DELETE: /users/1` -> To delete a specific user, it requires to be authenticated and have the admin role
    `POST: /users` -> To create a new user, it doesn't require to be authenticated.
    `PUT: /users/1` -> To update a specific user, it requires to be authenticated.
    `POST: /auth/login` -> To log in and receive the auth token, it requires to be authenticated.

### Install

- Install Atom or Microsoft Visual Studio text editor to view the code on your local machine.
- Install Git.
- Install ruby
- Install ruby on rails

### Tests

- This project includes unit tests and integration tests, to run the tests you will just need to run the following command in the terminal from the root of the project
  `$ rails db:migrate RAILS_ENV=test`
  `$ bundle exec rspec`


## Author

👤 **NSABIMANA Emmanuel**

- GitHub: [@emmyn5600](https://github.com/Emmyn5600)
- Twitter: [@NSABIMA62253884](https://twitter.com/NSABIMA62253884)
- LinkedIn: [@nsabimana-emmanuel-4276091b2](https://www.linkedin.com/in/nsabimana-emmanuel-4276091b2/)
- Portfolio: [Emmanuel](emmanuelnsabimana.netlify.app)

## Contributing

Contributions, [issues](https://github.com/Emmyn5600/Find-My-House-api/issues), and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

Copyright (c) 2021 [Emmanuel NSABIMANA](emmanuelnsabimana.netlify.app)
