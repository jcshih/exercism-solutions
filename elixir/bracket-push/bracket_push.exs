defmodule BracketPush do
  @opening ["(", "[", "{"]
  @closing [")", "]", "}"]
  @brackets Enum.zip(@opening, @closing) |> Enum.into(%{})

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> filter_brackets
    |> balance_brackets([])
  end

  defp filter_brackets(str) do
    str
    |> String.replace(~r/[^\(\)\[\]\{\}]/, "")
    |> String.codepoints
  end

  defp balance_brackets([], []), do: true
  defp balance_brackets([], _stack), do: false
  defp balance_brackets([b|brackets], stack) when b in @opening do
    balance_brackets brackets, [b|stack]
  end
  defp balance_brackets([b|brackets], [top|stack]) do
    case b == @brackets[top] do
      true ->
        balance_brackets brackets, stack
      _ ->
        false
    end
  end
  defp balance_brackets(_, _), do: false
end
