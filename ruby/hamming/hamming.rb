module Hamming
  VERSION = 1

  class << self
    def compute(a, b)
      fail ArgumentError unless a.length == b.length

      char_pairs(a, b)
        .map { |x, y| x == y }
        .count(false)
    end

    private

    def char_pairs(a, b)
      a.each_char.zip(b.each_char)
    end
  end
end
