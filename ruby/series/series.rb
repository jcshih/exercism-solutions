class Series
  def initialize(s)
    @nums = s.each_char.map(&:to_i)
  end

  def slices(n)
    fail ArgumentError unless n <= nums.size
    nums.each_cons(n).to_a
  end

  private

  attr_accessor :nums
end
