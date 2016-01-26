defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b        -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true           -> :unequal
    end
  end

  defp sublist?([], _), do: true
  defp sublist?(_, []), do: false
  defp sublist?(a, b=[_|bt]) do
    if match_head?(a, b) do
      true
    else
      sublist?(a, bt)
    end
  end

  defp match_head?([], _), do: true
  defp match_head?([h|at], [h|bt]) do
    at |> match_head?(bt)
  end
  defp match_head?(_, _), do: false
end
