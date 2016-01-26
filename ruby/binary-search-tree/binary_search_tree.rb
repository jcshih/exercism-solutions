class Bst
  attr_reader :data, :left, :right

  def initialize(d)
    @data = d
    @left = nil
    @right = nil
  end

  def insert(d)
    if d <= data
      insert_into(:left, d)
    else
      insert_into(:right, d)
    end
  end

  def insert_into(dst, data)
    node = instance_variable_get("@#{dst}")
    if node
      node.insert(data)
    else
      instance_variable_set "@#{dst}", Bst.new(data)
    end
  end

  def each(&block)
    traverse_in_order(&block)
  end

  def traverse_in_order
    left.traverse_in_order { |node| yield node } if left
    yield data
    right.traverse_in_order { |node| yield node } if right
  end
end
