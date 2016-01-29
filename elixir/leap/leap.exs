defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      except every year that is evenly divisible by 400.
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) when rem(year, 4) === 0 do
    rem(year, 100) !== 0 or rem(year, 400) === 0
  end
  def leap_year?(_), do: false
end