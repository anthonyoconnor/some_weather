
defmodule TableFormatterTest do
  use ExUnit.Case

  import ExUnit.CaptureIO
  import SomeWeather.TableFormatter

  test "format is correct for the widths" do
    assert format_for([5, 3]) == "~-5s | ~-3s~n" 
  end

  test "the seperator is correct for the widths" do
    assert seperator([5, 3]) == "------+----"
  end

  test "widths are calculted correctly" do
    data = [["column1a-longer", "column1b"],["column2a", "column2b-evenlonger"]]
    assert widths_of(data) == [15, 19]
  end
  
  test "Output is correct" do
    data = %{"a" => 'x', "bb" => "yyy"}
    result = capture_io fn ->
      print(data)
    end
    assert result == """
    ---+----
    a  | x  
    ---+----
    bb | yyy
    ---+----
    """
  end
end
