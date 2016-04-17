defmodule Connect do
  @doc """
  Calculates the winner (if any) of a board
  using "O" as the white player
  and "X" as the black player
  """
  @spec result_for([String.t]) :: :none | :black | :white
  def result_for(board) do
    board = board |> Enum.map(&String.codepoints/1)
    cond do
      black_win?(board) -> :black
      white_win?(board) -> :white
      true -> :none
    end
  end

  defp black_win?(board) do
    board
    |> Enum.with_index
    |> Enum.filter(fn {row, _} -> hd(row) == "X" end)
    |> Enum.any?(fn {row, i} ->
      dfs {hd(row), {i, 0}}, board
    end)
  end

  defp white_win?(board) do
    hd(board)
    |> Enum.with_index
    |> Enum.filter(fn {cell, _} -> cell == "O" end)
    |> Enum.any?(fn {cell, j} ->
      dfs {cell, {0, j}}, board
    end)
  end

  defp dfs({cell, start}, nodes) do
    dfs {cell, start}, nodes, [start]
  end

  defp dfs({cell, {i, j}}, nodes, visited) do
    right_edge = length(hd(nodes)) - 1
    bottom_edge = length(nodes) - 1
    case {cell, {i, j}} do
      {"X", {_, ^right_edge}} -> true
      {"O", {^bottom_edge, _}} -> true
      _ -> visit_neighbors({cell, {i, j}}, nodes, visited)
    end
  end

  defp visit_neighbors({cell, {i, j}}, nodes, visited) do
    neighbors({i, j}, {length(nodes), length(hd(nodes))})
    |> Enum.filter(fn {i, j} -> cell == nodes |> Enum.at(i) |> Enum.at(j) end)
    |> Enum.reject(&(Enum.member? visited, &1))
    |> Enum.any?(fn neighbor ->
      dfs {cell, neighbor}, nodes, [neighbor | visited]
    end)
  end

  defp neighbors({i, j}, {bottom_edge, right_edge}) do
    for x <- -1..1, y <- -1..1,
        x != y,
        a = x + i, b = y + j,
        a >= 0, b >= 0,
        a < bottom_edge, b < right_edge,
        do: {a, b}
  end
end
