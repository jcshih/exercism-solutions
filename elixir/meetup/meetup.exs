defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @days [ :monday, :tuesday, :wednesday,
          :thursday, :friday, :saturday, :sunday ]

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    1..31
    |> Enum.map(&({ year, month, &1 }))
    |> Enum.filter(&(:calendar.valid_date(&1)))
    |> Enum.filter(&(same_day_number?(&1, weekday)))
    |> Enum.filter(&(same_schedule?(&1, schedule)))
    |> List.last
  end

  @spec same_day_number?(:calendar.date, weekday) :: boolean
  defp same_day_number?(date, day) do
    :calendar.day_of_the_week(date) === Enum.find_index(@days, &(&1 === day)) + 1
  end

  @spec same_schedule?(:calendar.date, schedule) :: boolean
  defp same_schedule?({ _, _, day }, :first), do: day <= 7
  defp same_schedule?({ _, _, day }, :second), do: day in 8..14
  defp same_schedule?({ _, _, day }, :third), do: day in 15..21
  defp same_schedule?({ _, _, day }, :fourth), do: day in 22..28
  defp same_schedule?({ _, _, day }, :last), do: true
  defp same_schedule?({ _, _, day }, :teenth), do: day in 13..19
  defp same_schedule?(_, _), do: false 
end
