defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.

  The default factors are 3 and 5.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors \\ [3, 5]) do
    1..limit - 1
    |> Enum.filter(fn x -> factor?(x, factors) end)
    |> Enum.sum
  end

  def factor?(n, factors) do
    factors |> Enum.any?(fn x -> rem(n, x) == 0 end)
  end
end
