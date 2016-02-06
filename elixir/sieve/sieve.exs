defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    2..limit |> Enum.into([]) |> sieve([])
  end

  defp sieve([], primes), do: primes |> Enum.reverse
  defp sieve([ prime | candidates ], primes) do
    new_candidates = candidates |> Enum.reject(&(rem(&1, prime) == 0))
    sieve(new_candidates, [ prime | primes ])
  end
end
