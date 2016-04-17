defmodule BinTree do
  @moduledoc """
  A node in a binary tree.

  `value` is the value of a node.
  `left` is the left subtree (nil if no subtree).
  `right` is the right subtree (nil if no subtree).
  """
  @type t :: %BinTree{ value: any, left: BinTree.t | nil, right: BinTree.t | nil }
  defstruct value: nil, left: nil, right: nil
end

defmodule Zipper do
  @type t :: %Zipper{
    focus: BT.t | nil,
    trail: [{:left, any, BT.t} | {:right, any, BT.t}]
  }
  defstruct focus: nil, trail: []
  alias BinTree, as: BT
  alias Zipper, as: Z

  @doc """
  Get a zipper focused on the root node.
  """
  @spec from_tree(BT.t) :: Z.t
  def from_tree(bt) do
    %Z{focus: bt}
  end

  @doc """
  Get the complete tree from a zipper.
  """
  @spec to_tree(Z.t) :: BT.t
  def to_tree(%Z{focus: bt, trail: []}), do: bt
  def to_tree(z), do: to_tree up(z)

  @doc """
  Get the value of the focus node.
  """
  @spec value(Z.t) :: any
  def value(%Z{focus: focus}) do
    focus.value
  end

  @doc """
  Get the left child of the focus node, if any.
  """
  @spec left(Z.t) :: Z.t | nil
  def left(%Z{focus: %BT{left: nil}}), do: nil
  def left(%Z{focus: focus, trail: trail}) do
    %BT{value: value, left: left, right: right} = focus
    %Z{focus: left, trail: [{:left, value, right} | trail]}
  end

  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Z.t) :: Z.t | nil
  def right(%Z{focus: %BT{right: nil}}), do: nil
  def right(%Z{focus: focus, trail: trail}) do
    %BT{value: value, left: left, right: right} = focus
    %Z{focus: focus.right, trail: [{:right, value, left} | trail]}
  end

  @doc """
  Get the parent of the focus node, if any.
  """
  @spec up(Z.t) :: Z.t
  def up(%Z{trail: []}), do: nil
  def up(%Z{focus: left, trail: [{:left, value, right} | trail]}) do
    new_focus = %BT{value: value, left: left, right: right}
    %Z{focus: new_focus, trail: trail}
  end
  def up(%Z{focus: right, trail: [{:right, value, left} | trail]}) do
    new_focus = %BT{value: value, left: left, right: right}
    %Z{focus: new_focus, trail: trail}
  end

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Z.t, any) :: Z.t
  def set_value(z = %Z{focus: focus}, v) do
    new_focus = %{focus | value: v}
    %{z | focus: new_focus}
  end

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Z.t, BT.t) :: Z.t
  def set_left(z = %Z{focus: focus}, l) do
    %{z | focus: %{focus | left: l}}
  end

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Z.t, BT.t) :: Z.t
  def set_right(z = %Z{focus: focus}, r) do
    %{z | focus: %{focus | right: r}}
  end
end
