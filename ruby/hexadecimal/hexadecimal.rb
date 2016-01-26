class Hexadecimal
  HEX_TO_DEC = (0..9)
               .each_with_object({}) { |e, h| h[e.to_s] = e }
               .merge('a' => 10, 'b' => 11, 'c' => 12,
                      'd' => 13, 'e' => 14, 'f' => 15)

  attr_reader :hex

  def initialize(hex)
    hex = '0' unless /^[0-9a-f]+$/ =~ hex
    @hex = hex
  end

  def to_decimal
    hex
      .each_char.map { |x| HEX_TO_DEC[x] }
      .reverse
      .each_with_index
      .map { |x, i| x * 16**i }
      .reduce(0, :+)
  end
end
