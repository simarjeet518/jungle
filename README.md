# Jungle

A mini e-commerce application built with Rails.

## Final Product

![Sign up](https://raw.githubusercontent.com/simarjeet518/jungle/ffdbbc1a430f68b1b0972d8f4ba349d74eafafa5/docs/signup.png)

![Home](https://raw.githubusercontent.com/simarjeet518/jungle/ffdbbc1a430f68b1b0972d8f4ba349d74eafafa5/docs/Homepage.png)

![Order](https://raw.githubusercontent.com/simarjeet518/jungle/ffdbbc1a430f68b1b0972d8f4ba349d74eafafa5/docs/order.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Put Stripe (test) keys into appropriate .env vars
7. Run `bin/rails s -b 0.0.0.0` to start the server

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
