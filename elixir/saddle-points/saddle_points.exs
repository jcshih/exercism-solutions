defmodule Matrix do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    str
    |> String.split("\n")
    |> Enum.map(fn row ->
      row |> String.split(" ") |> Enum.map(&String.to_integer/1)
    end)
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str) do
    str
    |> rows
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    rows = rows str
    cols = columns str
    for x <- 0..(length(rows) - 1),
        y <- 0..(length(cols) - 1),
        row = rows |> Enum.at(x),
        col = cols |> Enum.at(y),
        saddle_point?(row |> Enum.at(y), row, col),
        do: {x, y}
  end

  defp saddle_point?(val, row, col) do
    val == Enum.max(row) && val == Enum.min(col)
  end
end
