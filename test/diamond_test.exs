defmodule TestDiamond do
  use ExUnit.Case
  use ExUnitProperties

  property "Diamond is non-empty" do
    check all original <- string(?A..?Z, length: 1) do
      diamond = Diamond.make(original)
      assert diamond != []
    end
  end

  property "Diamond first row contains A" do
    check all original <- string(?A..?Z, length: 1) do
      diamond = Diamond.make(original)
      assert true == List.first(diamond) |> String.contains?("A")
    end
  end

  property "Diamond last row contains A" do
    check all original <- string(?A..?Z, length: 1) do
      diamond = Diamond.make(original)
      assert true == List.last(diamond) |> String.contains?("A")
    end
  end

  property "Diamond is as wide as it is high" do
    check all original <- string(?A..?Z, length: 1) do
      diamond = Diamond.make(original)
      width = Enum.reduce(diamond, 0, fn x, acc -> max(acc, String.length(x)) end)
      height = Enum.count(diamond)
      assert height == width
    end
  end

  property "Diamond height is an odd number" do
    check all original <- string(?A..?Z, length: 1) do
      diamond = Diamond.make(original)
      require Integer
      assert true == Integer.is_odd(Enum.count(diamond))
    end
  end

  property "Diamond is vertically symmetrical" do
    check all original <- string(?A..?Z, length: 1) do
      diamond = Diamond.make(original)
      height = Enum.count(diamond)
      chunk = div(height + 1, 2)
      top_with_middle = Enum.take(diamond, chunk)
      bottom_with_middle = Enum.take(diamond, 0 - chunk)
      assert top_with_middle == Enum.reverse(bottom_with_middle)
    end
  end

  property "Diamond is horizontally symmetrical" do
    check all original <- string(?A..?Z, length: 1) do
      diamond = Diamond.make(original)
      height = Enum.count(diamond)
      width = height
      chunk = div(width + 1, 2)
      left_with_middle = Enum.map(diamond, fn x -> String.slice(x, 0, chunk) end)
      right_with_middle = Enum.map(diamond, fn x -> String.reverse(x) |> String.slice(0, chunk) end)
      assert left_with_middle == right_with_middle
    end
  end

end
