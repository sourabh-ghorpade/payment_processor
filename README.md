# README
This application processes transactions and generates bills for all of them on a monthly basis. The user, card and merchant data is assumed to be populated externally.

#Backlog
* Generate Bills for last month's transactions only. [Done]
* Add fees which will be configurable.
* Deploy to a prod environment.
* Generate a PDF for the Bill and email it.

# Requirements
* Ruby version
'3.0.0'

* System dependencies
Ruby, Rails.
* Configuration

* Database creation
We use postgres so login to postgres and create a db for payments_processor_db.

* Database initialization
rails db:migrate

* How to run the test suite
rspec

* Services (job queues, cache servers, search engines, etc.)
Nothing yet.

* Deployment instructions
TBD.


