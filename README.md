# ninteywineproblems

ninetywine problems is a mobile-first web app for recommending wine that will complement the taste of your food.

## Demo
See a demo video [here](https://www.youtube.com/watch?v=92j-XuH7sEk).

## Approach
This application is written in Rails, and consists of the following classes:

* `Wine` - holds data about wine
* `Food` - holds data about food
* `Pairing` - recommends wines based on food characteristics

The majority of the logic is kept in the `Pairing` model. Happily, this means that very little logic is implemented in controllers.

All CSS was custom written for the project; there are minimal UI components, so using a framework like Bootstrap would have been excessive.

The application is tested at the unit level RSpec, and feature tested in Capybara.

## How to Install
Download or clone this repo to your computer. When in the project directory, run `bundle install`. This requires you to have the bundler gem already installed.

## Getting Started
A database of 65 wine types has been provided as seed data. When you have installed all dependencies, create, migrate, and seed your database:

```ruby
bin/rake db:create
bin/rake db:migrate
bin/rails db:seed
```

Append `RAILS_ENV=test` to the end of the above commands to ensure that database changes are carried over to your test database, as well as your development database. Spin up a local Rails server, and then navigate to `localhost:3000` (assuming you haven't changed the default). You will be able to immediately start making wine and food pairings without the need to login.

## Future Development
At present, logic exists in the `Pairing` class to match the food and the wine. There are two improvements that could be made here:

1. Some methods are slightly overlong, suggesting they violate SRP and would benefit from a refactor;
2. The implementation of the wine and food pairing rules is sound; however, the rules themselves could benefit from more research.

In using the app, you may notice that some foods do not suggest any wines. This is a result of (2). Some domain expertise (from e.g. a sommelier) would be beneficial here, to ensure that the wine pairing rules implemented in the app are sound, and do not conflict too much.

Other potential future developments include: creating user accounts so that people can see old pairings that they've made; and refactoring the app to make controller calls asynchronously i.e. turn it into a single-page app.

## User stories

```
As a food eater
So that I can provide relevant information about the type of food I am eating
I would like to be able to give my meal a name

As a polite restaurant user
To quickly input what I am eating
I would like to be able to give my meal a sweet rating between zero and five

As a polite restaurant user
To quickly input what I am eating
I would like to be able to give my meal a spice rating between zero and five

As a polite restaurant user
To quickly input what I am eating
I would like to be able to give my meal a sour rating between zero and five

As a polite restaurant user
To quickly input what I am eating
I would like to be able to give my meal a bitter rating between zero and five

As a polite restaurant user
To quickly input what I am eating
I would like to be able to give my meal an umami rating between zero and five

As a polite restaurant user
So I can make a choice about my wine quickly
I would like to see a maximum of three recommendations for the food type I have provided

As a curious wine drinker
So that I can learn about wine and food
I want to see some information about a particular wine that has been recommended as matching with the food I am about to eat

As an indecisive eater
So that I can easily get multiple wine recommendations
I want to get from the results back to the food input form quickly

As a modern person
So that I can be impressed
I would like the app to look good
```
