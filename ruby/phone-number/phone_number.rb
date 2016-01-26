class PhoneNumber
  attr_reader :number

  def initialize(input)
    @number = clean(input)
  end

  def area_code
    number.slice(0, 3)
  end

  def prefix
    number.slice(3, 3)
  end

  def line_number
    number.slice(6, 4)
  end

  def to_s
    "(#{area_code}) #{prefix}-#{line_number}"
  end

  private

  def clean(input)
    num = input.scan(/\d/)
    num.shift if num.size == 11 && num.first == '1'
    return '0000000000' unless num.size == 10 && input.scan(/[a-z]/i).empty?
    num.join
  end
end
