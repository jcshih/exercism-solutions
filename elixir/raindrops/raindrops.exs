defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    factors = PrimeFactor.factors_for(number)

    [3, 5, 7]
    |> Enum.reduce("", fn (x, acc) ->
      raindrops(x, x in factors, acc)
    end)
    |> handle_empty_string(number)
  end

  defp raindrops(3, true, s), do: s <> "Pling"
  defp raindrops(5, true, s), do: s <> "Plang"
  defp raindrops(7, true, s), do: s <> "Plong"
  defp raindrops(_, _, s), do: s

  defp handle_empty_string("", number), do: number |> to_string
  defp handle_empty_string(result, _), do: result
end

defmodule PrimeFactor do
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    do_factors_for(number, 2, [])
  end

  defp do_factors_for(1, _, factors), do: factors |> Enum.reverse
  defp do_factors_for(number, divisor, factors) when rem(number, divisor) != 0 do
    do_factors_for(number, divisor + 1, factors)
  end
  defp do_factors_for(number, divisor, factors) do
    do_factors_for(div(number, divisor), divisor, [ divisor | factors ])
  end
end
