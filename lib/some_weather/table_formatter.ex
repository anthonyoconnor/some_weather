defmodule SomeWeather.TableFormatter do
  import Enum, only: [ each: 2, map: 2, map_join: 3, max: 1 ]

  def print(weather) do
    
    with data_by_columns = [Map.keys(weather), Map.values(weather)],
    column_widths   = widths_of(data_by_columns),
    format          = format_for(column_widths)

    do
      IO.puts(seperator(column_widths))
      Enum.each weather, fn {key, value} ->
        :io.format(format, [key, value])
        IO.puts(seperator(column_widths))
      end
    end

  end

  def widths_of(columns) do
    for column <- columns, do: column |> map(&String.length/1) |> max
  end

  def format_for(column_widths) do
    map_join(column_widths, " | ", fn width -> "~-#{width}s" end) <> "~n"
  end

  def seperator(column_widths) do
    map_join(column_widths, "-+-", fn width -> List.duplicate("-", width) end)
  end
end
