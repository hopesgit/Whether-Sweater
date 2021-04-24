# Whether, Sweater (Or, Sweater Weather!)

## Description
This is the Rails backend API for an imaginary frontend that aggregates weather data for a user who is planning a trip. The purpose of this app is to leverage two outside APIs to provide data that can be parsed and passed on to the frontend for user consumption.

## External APIs used
- [OpenWeather One Call API](https://openweathermap.org/api/one-call-api)
- [MapQuest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/)
- [Mystery image service API]()

## Versioning
This project uses semantic versioning. All endpoints, for the purposes of grading, will be preceded by "/api/v1/".

Ruby version: 2.5.3
Rails version: 5.2.5

## Endpoints
This will be filled out as functionality is added.

## Setup

As an extension, this app will be hosted on Heroku, if I  make it that far. You'll be able to send it commands at [Heroku]().
In that case, continuous integration (and testing) will be taken care of thanks to [Travis CI].

If you would like to download this app, clone it from GitHub and run these commands:

- `bundle install`
- `rails db:setup`

You'll be able to view test status by running:

`bundle exec rspec`

Afterward, you'll be able to view a coverage by opening the `index.html` report in the `coverage` folder.

Some API calls won't work without having API keys, so if you do decide to check these out for yourself, please make sure to get yourself API keys from the APIs listed under the `External APIs used` header. This app uses [Figaro](github.com/laserlemon/figaro) for local configurations.
