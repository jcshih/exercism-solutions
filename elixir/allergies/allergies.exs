defmodule Allergies do
  use Bitwise, only_operators: true

  @allergens [
    { 1, "eggs" }, { 2, "peanuts" }, { 4, "shellfish" }, { 8, "strawberries" },
    { 16, "tomatoes" }, { 32, "chocolate" }, { 64, "pollen" }, { 128, "cats" }
  ]

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags) do
    @allergens
    |> Enum.reject(fn { flag, _allergen } -> (flags &&& flag) == 0 end)
    |> Enum.map(fn { _flag, allergen } -> allergen end)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, item) do
    item in list(flags)
  end
end
