defmodule SomeWeather.NOAA do
  @user_agent [{"User-agent", "Elixir test program"}]
  def fetch(id) do
    url(id)
    |> HTTPoison.get(@user_agent)
    |> handle_reponse
  end

  def url(id) do
    "http://w1.weather.gov/xml/current_obs/#{id}.xml" 
  end

  def handle_reponse({:ok, %{status_code: 200, body: body}}) do
    {:ok, body}
  end

  def handle_reponse({_, %{status_code: _, body: body}}) do
    {:error, body}
  end
end
