defmodule Minesweeper do

  @doc """
  Annotate empty spots next to mines with the number of mines next to them.
  """
  @spec annotate([String.t]) :: [String.t]

  def annotate(board) do
    board = board |> Enum.map(&String.codepoints/1)
    board
    |> Enum.with_index
    |> Enum.map(fn {row, i} ->
      row
      |> Enum.with_index
      |> Enum.map_join(fn {cell, j} ->
        annotate_cell(cell, {i, j}, board)
      end)
    end)
  end

  defp annotate_cell("*", _, _), do: "*"
  defp annotate_cell(_, pos, board) do
    case Enum.count(neighbors(pos, board), &(&1 == "*")) do
      0 ->
        " "
      n ->
        to_string n
    end
  end

  defp neighbors({i, j}, board) do
    for x <- -1..1, y <- -1..1,
        x != 0 || y != 0,
        row = x + i, col = y + j,
        row >= 0, col >= 0,
        row < length(board), col < length(Enum.at(board, 0)),
        do: board |> Enum.at(row) |> Enum.at(col)
  end
end
