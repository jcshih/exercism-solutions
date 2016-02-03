defmodule Roman do
  @roman_numerals [
    { 1000, "M" }, { 900 , "CM" }, { 500 , "D" }, { 400 , "CD" },
    { 100, "C" }, { 90, "XC" }, { 50, "L" }, { 40, "XL" },
    { 10, "X" }, { 9, "IX" }, { 5, "V" }, { 4, "IV" }, { 1, "I" },
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    do_numerals(number, "")
  end

  @spec do_numerals(integer, String.t) :: String.t
  defp do_numerals(0, result), do: result
  defp do_numerals(number, result) do
    { arabic, roman } = Enum.find(@roman_numerals, fn { x, _ } ->
      number >= x
    end)
    do_numerals(number - arabic, result <> roman)
  end
end
