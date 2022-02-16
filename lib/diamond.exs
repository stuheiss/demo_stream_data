#!/usr/bin/env elixir
# diamond.exs

# php ord('c') => ?c
# php chr(ord('c')) => <<?c::utf8>>
# php chr(i) => <<i::utf8>>
# demo: ./lib/diamond.exs A

defmodule Diamond.CLI do
  @moduledoc """
  synopsis:
    Prints args, possibly multiple times, possibly upper cased.
  usage:
    $ lib/diamond.exs letter
  """

  def main([help_opt]) when help_opt == "-h" or help_opt == "--help" do
    IO.puts(@moduledoc)
  end
  def main(args) do
    {opts, cmd_and_args, errors} = parse_args(args)
    case errors do
      [] ->
        process_args(opts, cmd_and_args)
      _ ->
        IO.puts("Bad option:")
        IO.inspect(errors)
        IO.puts(@moduledoc)
    end
  end

  defp parse_args(args) do
    {opts, cmd_and_args, errors} =
      args
      |> OptionParser.parse(strict:
        [help: :boolean])
    {opts, cmd_and_args, errors}
  end

  defp process_args(_opts, args) do
    Code.require_file("lib/diamond.ex")
    arg = hd(args)
    Diamond.to_string(arg)
    |> IO.puts
  end

end

Diamond.CLI.main(System.argv)
