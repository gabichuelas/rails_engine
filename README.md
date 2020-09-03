## Rails Engine
### About
An api built in rails meant to practice building out api CRUD functionality and making ActiveRecord queries to a database seeded from a collection of .csv's.

### Tech
* Ruby 2.5.3
* Rails 6.0.3
* PostgreSQL
* RSpec for testing

### Local Setup
1. Fork & clone the repo
2. Run `bundle install` and if needed, `bundle update`
3. Run `rake data_setup:all` which will create, migrate, and seed the database with included csv files, as well as resetting the primary keys on all db tables.
4. Run local test suite with `bundle exec rspec`

### Database Schema
![Schema](https://user-images.githubusercontent.com/62727545/92139208-6964f200-eddd-11ea-9c04-a3b85f0cdcf7.png)
