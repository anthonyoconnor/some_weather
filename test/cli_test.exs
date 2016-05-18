defmodule CLITest do
  use ExUnit.Case
  doctest SomeWeather

  import SomeWeather.CLI

  test ":help returned by option parsing for -h and --help options" do
    assert parse_args(["-h"]) == :help
    assert parse_args(["--help"]) == :help
  end

  test "id returned by option parsing when given" do
    assert parse_args(["id"]) == "id"     
  end

end
