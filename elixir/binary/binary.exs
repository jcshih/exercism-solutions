defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    if valid_binary?(string) do
      string
      |> String.graphemes
      |> Enum.map(&String.to_integer/1)
      |> Enum.reverse
      |> Enum.with_index
      |> Enum.reduce(0, fn ({ x, i }, acc) ->
        acc + x * round(:math.pow(2, i))
      end)
    else
      0
    end
  end

  @spec valid_binary?(String.t) :: boolean
  defp valid_binary?(string) do
    Regex.match?(~r/^[01]*$/, string)
  end
end
