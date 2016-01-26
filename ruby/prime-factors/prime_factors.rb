require 'prime'

module PrimeFactors
  module_function

  def for(n)
    factors = []
    Prime.each do |p|
      while n % p == 0
        factors << p
        n /= p
      end
      break if n <= 1
    end
    factors
  end
end
