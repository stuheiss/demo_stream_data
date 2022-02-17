defmodule Diamond do
  @doc """
  Return ordinal value of first character in string
    String.to_charlist(str) |> Enum.at(0)
  """
  def ord(str) when is_binary(str) do
    String.to_charlist(str) |> Enum.at(0)
  end

  @doc """
  Return string character having ordinal value of i (2 versions)
    List.to_string([i])
    <<i::utf8>>
  """
  def chr(i) when is_integer(i) do
    <<i::utf8>>
  end

  def make(str \\ "A") do
    str = String.upcase(str) |> String.first
    idx = ord(str) - ?A
    size = (idx * 2) + 1
    do_make(str, idx, size, [])
  end

  defp do_make(cur, idx, size, acc) do
    cond do
      ord(cur) < ?A ->
        acc ++ (Enum.reverse(acc) |> tl)
      true ->
        do_make(chr(ord(cur) - 1), idx, size, [row_format(cur, size) | acc])
    end
  end

  defp row_format(cur, size) do
    idx = ord(cur) - ?A
    case cur do
      "A" ->
        # "A" is formatted "<outer_pad>A<outer_pad>"
        outer = div(size - 1, 2)
        outer_pad = String.duplicate(" ", outer)
        outer_pad <> "A" <> outer_pad
      _ ->
        # "X" is formatted "<outer_pad>X<inner_pad>X<outer_pad>"
        inner = ((idx - 1) * 2) + 1
        outer = div(size - 1, 2) - idx
        outer_pad = String.duplicate(" ", outer)
        inner_pad = String.duplicate(" ", inner)
        outer_pad <> cur <> inner_pad <> cur <> outer_pad
    end
  end

  def to_string(str \\ "A") do
    make(str)
    |> Enum.join("\n")
  end
end
