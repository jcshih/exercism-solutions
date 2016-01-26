class Trinary
  attr_reader :tri

  def initialize(tri)
    @tri = tri
  end

  def to_decimal
    tri.each_char
      .map(&:to_i)
      .reverse
      .each_with_index
      .map { |d, i| d * 3**i }
      .reduce(:+)
  end
end
