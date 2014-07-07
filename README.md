# Groupon demo

This app aims to replicate some of the features from Groupon.
It depends on [PostGIS](http://www.postgis.org/).

![](https://raw.githubusercontent.com/codeschool/FeatureFocus/groupon/docs/groupon.png)

* Detecting user location
* Listing nearby deals
* Generating referral links

## Setup

* run `bundle`
* run `rake db:setup`
    * This will also load seed data under **db/seeds.rb**

In order to fetch lat long coordinates from the Google Maps API, internet connection is needed when loading the seed data.
