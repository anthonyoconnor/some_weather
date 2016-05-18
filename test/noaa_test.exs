defmodule NOAATest do
  use ExUnit.Case
  doctest SomeWeather

  import SomeWeather.NOAA

  test "url correctly includes the id" do
    assert url("ABC") ==  
      "http://w1.weather.gov/xml/current_obs/ABC.xml" 
  end

  #This is more of an integration tests since it actually hits
  #the website and expects to get an error back
  test "anything" do
    assert match?  {:error, _}, fetch("shouldNeverExistHopefully")
  end
end
