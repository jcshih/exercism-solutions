defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest. 
  """
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
