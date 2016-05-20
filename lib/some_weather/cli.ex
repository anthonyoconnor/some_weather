defmodule SomeWeather.CLI do

  def run(argv) do
    argv
    |> parse_args
    |> process
  end


  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean], aliases: [h: :help])    

    case parse do
      {[help: true], _, _} -> :help
      {_, [airport_id], _} -> airport_id
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage: some_weather <airport_id>
    """
    System.halt(0)
  end


  def process(id) do
   SomeWeather.NOAA.fetch(id) 
   |> decode_response
   |> SomeWeather.WeatherExtractor.extract
  end

  def decode_response({:ok, body}), do: body

  def decode_response({:error, error }) do
    message = error["message"]
    IO.puts "Error trying to receive latest data. Message: #{message}"
    System.halt(2)
  end
end
