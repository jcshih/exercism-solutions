defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) do
    pow(2, number - 1)
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    1..64
    |> Enum.map(&square/1)
    |> Enum.sum
  end

  @spec pow(integer, integer) :: integer
  defp pow(_, 0), do: 1
  defp pow(x, n) when rem(n, 2) === 1, do: x * pow(x, n - 1)
  defp pow(x, n) do
    r = pow(x, div(n, 2))
    r * r
  end
end
