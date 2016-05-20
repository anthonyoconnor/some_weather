defmodule WeatherExtractorTest do
  use ExUnit.Case

  import SomeWeather.WeatherExtractor

  test "xml is extracted correctly" do
    sample_xml =
    """
    <current_observation>
      <location>Somewhere</location>
      <station_id>ABC</station_id>
      <temp_c>40.0</temp_c>
      <weather>warm</weather>
    </current_observation>
    """
    output = extract(sample_xml)

    assert output[:location] == 'Somewhere'
    assert output[:station_id] == 'ABC'
    assert output[:temp_c] == '40.0'
    assert output[:weather] == 'warm'
  end
end
