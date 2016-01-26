class Array
  def keep
    [].tap { |arr| each { |e| arr << e if yield(e) } }
  end

  def discard
    [].tap { |arr| each { |e| arr << e unless yield(e) } }
  end
end
