defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map()
  def transform(input) do
    input
    |> Enum.flat_map(fn { score, keys } ->
      keys |> Enum.map(fn key -> { String.downcase(key), score } end)
    end)
    |> Enum.into(%{})
  end
end
