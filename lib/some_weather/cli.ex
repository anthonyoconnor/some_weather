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
  end
end
