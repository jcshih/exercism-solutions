defmodule RunLengthEncoder do 
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form. 
  "1H1O1R1S1E" => "HORSE" 
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(string) do
    string
    |> String.graphemes
    |> Enum.chunk_by(fn x -> x end)
    |> Enum.map(fn [ value | _t ] = chunk ->
      { Enum.count(chunk), value }
    end)
    |> Enum.map(fn { count, value } -> "#{count}#{value}" end)
    |> Enum.join
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/\d*\w/, string)
    |> List.flatten
    |> Enum.map(fn x ->
      matches = Regex.named_captures(~r/(?<c>\d*)(?<v>\w)/, x)
      { String.to_integer(matches["c"]), matches["v"] }
    end)
    |> Enum.map(fn { c, v } -> String.duplicate(v, c) end)
    |> Enum.join
  end
end
