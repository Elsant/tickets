# README

This Tickets application is developed to allow customers to be able to place support request and the support agents to process the
requests. 

## Requirements

* Ruby 2.4.0
* Ruby on Rails 5.1.0.rc1
* Node.js
* Yarn

I. Development environment
1. In MySQL create user, grant privileges.
2. Install gems
  $ bin/bundle install
3.Create database and seed data
  $ bin/rails db:setup
4. Install web packer dependencies
    $ bin/rails webpacker:install
5. Start server
  $ foreman start -f Procfile.dev

  or start separate processes in 2 different terminal windows

  $ bin/rails server
  $ bin/webpack-dev-server


II. Test environment
1. Run tests with
  $ rspec spec


III. Production environment

1. In MySQL create user, grant privileges.
2. Install gems
  $ RAILS_ENV=production bundle install
3. Create database and seed data
  $ RAILS_ENV=production bin/rails db:setup
4. Precompile assets( They are already precompiled for production and are in public folder)
  $ RAILS_ENV=production bin/rails assets:precompile
5. If we run only puma local in production mode, we must set in .env  (already set). Remove this using nginx etc.
  RAILS_SERVE_STATIC_FILES=true
6. Run server
  $ RAILS_ENV=production bin/rails server


TODO
  1. Authentication with CanCanCan or Pundit.
  2. Pagination with Kaminari.