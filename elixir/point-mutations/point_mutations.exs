defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(s1, s2) when length(s1) === length(s2) do
    Enum.zip(s1, s2)
    |> Enum.map(fn {x, y} -> x !== y end)
    |> Enum.count(&(&1 === true))
  end
  def hamming_distance(_, _), do: nil
end
