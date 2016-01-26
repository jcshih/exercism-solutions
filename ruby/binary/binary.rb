class Binary
  VERSION = 1

  attr_reader :bin

  def initialize(bin)
    fail ArgumentError, 'Not valid binary' unless bin.match(/^[01]+$/)
    @bin = bin
  end

  def to_decimal
    bin
      .each_char
      .map(&:to_i)
      .reverse
      .each_with_index
      .map { |d, i| d * 2**i }
      .reduce(:+)
  end
end
