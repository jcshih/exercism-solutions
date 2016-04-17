defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct white: {0, 3}, black: {7, 3}
  alias Queens, as: Q

  @doc """
  Creates a new set of Queens
  """
  def new(pos, pos), do: raise ArgumentError
  def new(white, black) do
    %Q{white: white, black: black}
  end
  def new, do: %Q{}

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Q.t()) :: String.t()
  def to_string(%Q{white: white, black: black}) do
    blank_board
    |> place_queen("W", white)
    |> place_queen("B", black)
    |> stringify_board
  end

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Q.t()) :: boolean
  def can_attack?(%Q{white: {wx, _}, black: {bx, _}}) when wx == bx, do: true
  def can_attack?(%Q{white: {_, wy}, black: {_, by}}) when wy == by, do: true
  def can_attack?(%Q{white: {wx, wy}, black: {bx, by}}) when abs(wx - wy) == abs(bx - by), do: true
  def can_attack?(_), do: false

  defp blank_board do
    "_"
    |> List.duplicate(8)
    |> List.duplicate(8)
  end

  defp place_queen(board, symbol, {x, y}) do
    board
    |> List.update_at(x, fn row ->
      List.replace_at row, y, symbol
    end)
  end

  defp stringify_board(board) do
    board
    |> Enum.map(&(Enum.join(&1, " ")))
    |> Enum.join("\n")
  end
end
