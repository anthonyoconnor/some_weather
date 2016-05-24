defmodule NOAATest do
  use ExUnit.Case

  import SomeWeather.NOAA

  test "url correctly includes the id" do
    assert url("ABC") ==  
      "http://w1.weather.gov/xml/current_obs/ABC.xml" 
  end

  @tag :external
  test "Error is returned when a non existent id is used" do
    assert match?  {:error, _}, fetch("shouldNeverExistHopefully")
  end
end
