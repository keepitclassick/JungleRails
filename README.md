# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

# Features 

## Signup/Login implemented using bcrypt with Rails.

## Admin Privileges
Authenticated admins can add/edit/delete products and categories.

## Product Selection
Users can browse and add products to cart directly from the home page.

Products can also be seen in their individual pages, or under their respective categories.

## Checkout
Users can complete their purchase using Stripe, and see the details of their order.

------------------------------------------
Home Page with Logged in User
![Home Page with Logged in User](https://raw.githubusercontent.com/keepitclassick/JungleRails/0c7ed9a2e285fba819be1a1da82148563bd7f15c/public/C42F2F05-BABE-4D25-8EE6-9D3362533322_1_105_c.jpeg)

Admin Page showing All Products
![Admin Products Page](https://raw.githubusercontent.com/keepitclassick/JungleRails/0c7ed9a2e285fba819be1a1da82148563bd7f15c/public/1C1182DE-45B7-4814-941F-43AA304D55DF_1_105_c.jpeg)

The Cart
![The Cart](https://raw.githubusercontent.com/keepitclassick/JungleRails/0c7ed9a2e285fba819be1a1da82148563bd7f15c/public/D41DCA71-329D-45C1-82C9-6EE9C87A6B36_1_105_c.jpeg)
-----------------------------------------

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
