### Overview
This application is built in Ruby on Rails, it works also as an API. It shows a vehicle's most recent coordinates in a map.

### Endpoints

- The first endpoint is `/api/v1/gps` this is a POST end point that receives content of type `application/json` and it consists in an array of objects like the following.
```json
[
    {
        "latitude": 20.23,
        "longitude": -0.56,
        "sent_at": "2016-06-02 20:45:00",
        "vehicle_identifier": "HA-3452"
    },
]
```

- The second endpoint shows the most recent coordinate of the vehicle created using the previous endpoint sorted by the attribute `sent_at`.

Clarification: gps endpoint will create and associate Waypoints to multiple vehicles if given, but as the assignment instructions stated I only show one vechile in the `/show` (last one `Vehicle.last`). I only assumed this because nowhere in the instructions said that an `id` or something similar would be providad to sort an specific vehicle.

### Testing
The library used for testing is `rspec`. Additional gems where installed to help with testing like `FactoryBot`, `Faker`.

### Libraries

The library [MapBox](https://www.mapbox.com/) was used to provide a map interface and show its coordinates with a Marker. To use Javascript in a simple way I installed the modest framework [Stimulus](https://stimulusjs.org/) that helps you use Javascript in your rails app in a very simple and efficient way for the the HTML you already have.
The last library is Sidekiq, this one is used for handling async task in the app (loading vehicles into the DB)

### Running the App

For running the application locally in your machine, and to avoid all kind of problemas just install docker and run the following commands.

Build
```bash
docker-compose build
```
Install gems
```bash
docker-compose run beetrack-v2 bundle install
```
Install packages
```bash
docker-compose run beetrack-v2 yarn install
```
Create DB
```bash
docker-compose run beetrack-v2 bundle exec rails db:create
```

Finally you can run this command to start the project in `localhost:3000`.
```bash
docker-compose up
```
