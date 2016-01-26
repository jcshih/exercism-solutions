class Array
  def accumulate(&block)
    [].tap { |arr| each { |e| arr << block.call(e) } }
  end
end
