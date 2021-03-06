class Squares
  VERSION = 1

  def initialize(n)
    @n = n
  end

  def square_of_sums
    (1..@n).inject(:+)**2
  end

  def sum_of_squares
    (1..@n).inject(0) { |a, e| a + e**2 }
  end

  def difference
    square_of_sums - sum_of_squares
  end
end
