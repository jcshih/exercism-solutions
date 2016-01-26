class SumOfMultiples
  def self.to(n)
    (1...n).select { |e| [3, 5].any? { |m| e % m == 0 } }.reduce(0, :+)
  end

  def initialize(*args)
    @multiples = args
  end

  def to(n)
    (1...n).select { |e| multiples.any? { |m| e % m == 0 } }.reduce(0, :+)
  end

  private

  attr_reader :multiples
end
