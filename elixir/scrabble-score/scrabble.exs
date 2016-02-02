defmodule Scrabble do
  @scores for { s, cs } <- %{
    1 => ~c(aeioulnrst),
    2 => ~c(dg),
    3 => ~c(bcmp),
    4 => ~c(fhvwy),
    5 => ~c(k),
    8 => ~c(jx),
    10 => ~c(qz)
  }, c <- cs, into: %{}, do: { c, s }

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    Regex.replace(~r/[^a-z]/, String.downcase(word), "")
    |> to_char_list
    |> Enum.map(&(@scores[&1]))
    |> Enum.sum
  end
end
