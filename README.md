# Ruby on Rails REST API with JWT authentication Project

## A fully functional gossip app backend 

This API, named NUS Grapevine, allows online users to interact with each other on a web forum-like page and discuss topics relevant to certain tags, such as academics, extracurriculars and entertainment. This project was made as a submission to the NUS CVWO assignment 2023/2024. Currently, this API supports several features

* **User authentication and registration:** Users can sign up for an account, solely authenticated by their username
* **Post creation:** Author can create new posts with a title, text content and several tags if necessary.
* **Post management:** Author can view, edit, and delete their own posts.
* **Commenting and Liking:** Users can add/edit comments and likes to posts. 

## Getting Started

To get a local copy up and running, note the prerequisites and follow these steps.

### Prerequisites

- [ ] Ruby
- [ ] Rails
- [ ] MySQL
- [ ] Git and Github
- [ ] Any code editor (VSC, Brackets, etc)

### Instructions

1. Open terminal
2. Navigate to your desired location to place this repository
3. Copy and paste the following code into the terminal: git clone https://github.com/positivelyjon/gossip-app-backend.git
4. Run `cd gossip-app-backend`
5. Run `bundle install`
6. Run `open config/database.yml`
7. Change the default password to your password assigned to your MySQL instance
8. Run `rails db:create`
9. Run `rails db:migrate`
10. Run `rails db:seed`
11. Run `rails server`


