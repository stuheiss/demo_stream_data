defmodule TestReverse do
  use ExUnit.Case
  use ExUnitProperties

  import MyList, only: [ reverse: 1 ]

  property "a reversed list has the same length as the original" do
    check all original <- list_of(term()) do
      reversed = MyList.reverse(original)
      assert length(reversed) == length(original)
    end
  end

  property "reversing a list twice returns the original" do
    check all original <- list_of(term()) do
      reversed = MyList.reverse(original)
      assert original == MyList.reverse(reversed)
    end
  end

  property "reversing a list of length 1 does nothing" do
    check all original <- list_of(term(), length: 1) do
      reversed = MyList.reverse(original)
      assert original == reversed
    end
  end

  property "reversing a list of length 2 swaps the elements" do
    check all original <- list_of(term(), length: 2) do
      [b, a] = MyList.reverse(original)
      assert [ a, b ] == original
    end
  end

  property "reversing a list of length 3 swaps the extremes" do
    check all original <- list_of(term(), length: 3) do
      [c, b, a] = MyList.reverse(original)
      assert [ a, b, c ] == original
    end
  end
end
