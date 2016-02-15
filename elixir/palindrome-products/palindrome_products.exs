defmodule Palindromes do

  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map() 
  def generate(max_factor, min_factor \\ 1) do
    palindrome_factors(max_factor, min_factor)
    |> Enum.reduce(%{}, fn { a, b }, acc ->
      Map.update(acc, a * b, [[ a, b ]], &([ [ a, b ] | &1 ]))
    end)
  end

  def palindrome_factors(max_factor, min_factor) do
    for a <- min_factor..max_factor,
        b <- min_factor..a,
        is_palindrome_product?(a * b),
        do: { b, a }
  end

  def is_palindrome_product?(n) do
    n == n |> Integer.to_string |> String.reverse |> String.to_integer
  end
end
