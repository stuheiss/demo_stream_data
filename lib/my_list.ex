defmodule MyList do
  def reverse(list), do: do_reverse(list, [])

  defp do_reverse([], acc), do: acc
  defp do_reverse([x|xs], acc), do: do_reverse(xs, [x|acc])
end
