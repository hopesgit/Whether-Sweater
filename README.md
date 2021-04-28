# Whether, Sweater (Or, Sweater Weather!)

## Description
This is the Rails backend API for an imaginary frontend that aggregates weather data for a user who is planning a trip. The purpose of this app is to leverage outside APIs to provide data that can be parsed and passed on to the frontend for user consumption.

## External APIs used
- [OpenWeather One Call API](https://openweathermap.org/api/one-call-api)
- [MapQuest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/)
- [Bing Image Search API](https://docs.microsoft.com/en-us/bing/search-apis/bing-image-search/reference/endpoints)

## Versioning
This project uses semantic versioning. All endpoints, for the purposes of grading, will be preceded by "/api/v1/".

- Ruby version: 2.5.3
- Rails version: 5.2.5

## Endpoints
- get '/api/v1/forecast' - Requires "location" params - Returns current weather as well as 5-day forecast and 8-hour forecast
- get '/api/v1/backgrounds' - Requires "location params - Returns an image for use as a background
- post '/api/v1/users' - Requires that user's email, password, and password_confirmation be sent in a JSON body - Creates a user
- post '/api/v1/sessions' - Requires a registered user's email and password be sent in a JSON body - Returns user information for login purposes
- post '/api/v1/road_trips' - Requires a user's api key, as well as the starting and ending cities, be passed in a JSON body - Creates a road trip

## Setup

As an extension, this app will be hosted on Heroku, if I  make it that far. You'll be able to send it commands at [Heroku]().
In that case, continuous integration (and testing) will be taken care of thanks to [Travis CI]().

If you would like to download this app, clone it from GitHub and run these commands:

- `bundle install`
- `rails db:setup`

You'll be able to view test status by running:

`bundle exec rspec`

Afterward, you'll be able to view a coverage by opening the `index.html` report in the `coverage` folder.

Some API calls won't work without having API keys, so if you do decide to check these out for yourself, please make sure to get yourself API keys from the APIs listed under the `External APIs used` header. This app uses [Figaro](github.com/laserlemon/figaro) for local configurations.

## Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

- [Requirements to meet](https://backend.turing.edu/module3/projects/sweater_weather/requirements)
