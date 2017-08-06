# order_api

A simple API for tracking orders

## Development

### Ruby

Make sure you are using the correct version of ruby

```
ruby --verison

=> ruby 2.3.3
```
### Install gems and run migrations

```sh
bundle install
rails db:migrate
rails db:seed

bundle exec rspec
```

### Run the server

```sh
bin/rails s
```

## Endpoints

### Orders per customer

```sh
curl http://localhost:3000/customers/1/orders
```

### Quantity of products sold

```sh
curl http://localhost:3000/products
```

#### Specifying A date range by day, week, month

```sh
curl "http://localhost:3000/products?startdate=2017-08-05&enddate=2017-08-10&per=day"
```