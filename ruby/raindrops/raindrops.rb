require 'prime'

module Raindrops
  VERSION = 1

  CONVERSION_MAP = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }

  module_function

  def convert(number_of_raindrops)
    factors = prime_factors(number_of_raindrops)
    result = CONVERSION_MAP.map.each { |k, v| v if factors.include?(k) }.join
    return number_of_raindrops.to_s if result.empty?
    result
  end

  def prime_factors(n)
    n.prime_division.map(&:first)
  end
end
