# README

To get the
application up and running:

Remember to run:
bundle install
db:create
db:migrate
db:seed
rails test
rails server

Built so far:
post "/people" => "people#create" Pass us, minimum: email and password as params. Receive: All of that person's column and linked data such as the experience records.
get "/people" => "people#index" Receive all of the people's fields
get "/people/:id" => "people#show"  Pass us, minimum: email and password as params. Receive: All of that person's column and linked data such as the experience records.
post "/sessions" => "sessions#create" Pass us, minimum: email and password as params. Receive: The JWT, email, and person id.

Field names so far:
"first_name"
"last_name"
"email"
"phone_number"
"short_bio"
"linkedin_url"
"twitter_handle"
"personal_blog_url"
"online_resume_url"
"github_url"
"photo"
"created_at"
"updated_at"



Things we may want to cover:

* Ruby version

* System dependencies

* Configuration

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* ...
