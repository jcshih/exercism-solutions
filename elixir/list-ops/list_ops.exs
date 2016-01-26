defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    _count(l, 0)
  end

  defp _count([], size), do: size
  defp _count([_h|t], size) do
    _count(t, size + 1)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    _reverse(l, [])
  end

  defp _reverse([], r), do: r
  defp _reverse([h|t], r) do
    _reverse(t, [h|r])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    _map(l, f, []) |> reverse
  end

  def _map([], _f, acc), do: acc
  def _map([h|t], f, acc) do
    _map(t, f, [f.(h)|acc])
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    _filter(l, f, []) |> reverse
  end

  defp _filter([], _f, acc), do: acc
  defp _filter([h|t], f, acc) do
    if f.(h) do
      _filter(t, f, [h|acc])
    else
      _filter(t, f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([h|t], acc, f) do
    reduce(t, f.(h, acc), f)
  end

  @spec append(list, list) :: list
  def append([], b), do: b
  def append([h|t], b) do
    [h|append(t, b)]
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reduce(reverse(ll), [], &append/2)
  end
end
