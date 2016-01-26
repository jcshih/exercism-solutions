defmodule Teenager do
  def hey(input) do
    cond do
      "" == String.strip(input) ->
        "Fine. Be that way!"
      input == String.upcase(input) and input != String.downcase(input) ->
        "Whoa, chill out!"
      String.ends_with?(input, "?") ->
        "Sure."
      true ->
        "Whatever."
    end
  end
end
