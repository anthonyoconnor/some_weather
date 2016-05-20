defmodule SomeWeather.WeatherExtractor do
  
  require Record
  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText, Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  def extract(xml) do
    readxml(xml)
    |> extract_data
  end

  defp readxml(xml) do
    :xmerl_scan.string(String.to_char_list(xml))
  end

  defp extract_data({xml, _}) do
    location = extract(xml, '/current_observation/location')
    station_id = extract(xml, '/current_observation/station_id')
    weather = extract(xml, '/current_observation/weather')
    temp_c = extract(xml, '/current_observation/temp_c')
    %{location: location, station_id: station_id, weather: weather, temp_c: temp_c}
  end

  defp extract(xml, xpath) do
    [element] = :xmerl_xpath.string(xpath, xml)
    [text] = xmlElement(element, :content)
    xmlText(text, :value)
  end
end
