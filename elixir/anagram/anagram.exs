defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base_sig = signature(base)

    candidates
    |> Enum.reject(fn(c) -> String.downcase(c) == base end)
    |> Enum.filter(fn(c) -> signature(c) == base_sig end)
  end

  @spec signature(String.t) :: String.t
  def signature(s) do
    s
    |> String.downcase
    |> String.to_char_list
    |> Enum.sort
    |> List.to_string
  end
end
