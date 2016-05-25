# SomeWeather

This is a basic application that pulls some weather data from the 
National Oceanic and Atmospheric Administration and displays it in a table.

This is an exercise from Programming Elixir 1.2 used for learning Elixir.
So don't take anything in here as best practices. 

Exercise requirements:

In the United States, the National Oceanic and Atmospheric Administration
provides hourly XML feeds of conditions at 1,800 locations. 8 For example:
http://w1.weather.gov/xml/current_obs/KDTO.xml .

Write an application that fetches this data, parses it, and displays it in a
nice format.

## Package Application
    mix escript.build

## Usage
    ./some_weather <airport_id>

Note: The list of airport ids can be found at http://w1.weather.gov/xml/current_obs/

### Example 
    ./some_weather KDTO

## Example Output

    ---------------+-----------------------------
    location       | Denton Municipal Airport, TX
    ---------------+-----------------------------
    station id     | KDTO
    ---------------+-----------------------------
    temp degrees C | 27.2
    ---------------+-----------------------------
    weather        | Overcast
    ---------------+-----------------------------

