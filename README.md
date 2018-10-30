# README

## Homeday.de

### Property Comparison Tool
At Homeday, we are working to improve the process of selling real estate by giving real estate agents the best tools to do their job.

One of the most important questions when dealing with real estate is the property price. Given a specific property, there isn't always a clear way to arrive at a price, but there are estimations, comparisons, historical data, etc. that can support an agent in giving a realistic price estimation.

We have accumulated an extensive database of real estate listings dating back several years ago and covering the whole Germany. That data is used both to provide estimations and values to compare.

### Your task

Your task will be to build a service that, given latitude and longitude of an object, its type and marketing type, returns a list of similar objects with their prices.

A little insight into terms: `property_type` is just either `apartment` or `single_family_house` and marketing type is either `rent` or `sell`.

Consider the following scenario:

- Alice, the real estate agent, is asked to estimate the sell price of an apartment that is located in Marienburger Straße 31 10405 Prenzlauer Berg, Berlin.
- Alice wants to figure out prices of similar apartments in Prenzlauer Berg
- Alice calls your service with the following params:
  - `lng` : `13.4236807`
  - `lat` : `52.5342963`
  - `property_type` : `apartment`
  - `marketing_type` : `sell`
- Alice receives a list of properies near the point she specified along with their prices.

### API
* Ruby version
  ruby-2.5.1
* System dependencies
  - bundle
  - postgres
  - postgis (geo location for postgres)

* Configuration
  - You need to install [postgis] (https://postgis.net/install/), if you are on a mac is as simple as running `brew install postgis`
  - The rest should be installed by running `bin/setup`
* How to run the test suite
  `bundle exec rspec`
* How to run and test the api
  `bundle exec rails s`
  `curl http://localhost:3000/properties\?latitude\=52.48696\&longitude\=13.46247\&property_type\=apartment\&marketing_type\=rent`

### Design Decisions & TODO's
  - There are a few options to do geo location in rails, I did some research and [GeoKit](https://github.com/geokit/geokit) is commonly
  used for this, but digging further I found that is good for simple use, but when performance is needed [postgis] (https://postgis.net/install/) is the way to go
  - Using [postgis] (https://postgis.net/install  I soon realized that I needed an index on the location data to make it performant, so I decided to add a new column to the
    `properties` table to store this location in a postgis friendly format. I then created an index for this column and I use it to do all the geo location queries. I also decided to keep the lat and lgn columns and I use them to convert the coordinates to a POINT.
  - I didn't do this, but when new properties are created, maybe using GeoKit to get their coordinates would be a good idea, but this was out of the scope of this challenge so I
  decided not to do it at this time
  - If we are going to use GeoLocation in more than one model, I'd extract the `within` scope and any other related methods into a `concern`, also didn't do this, because it was only being used in a single model
  - I decided to use rails, because it was easier to bootstrap than grape and I actually needed ActiveRecord
