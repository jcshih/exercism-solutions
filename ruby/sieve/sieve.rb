class Sieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def primes
    candidates = [nil, nil, *(2..limit)]
    candidates.each do |p|
      next if p.nil?
      break if p * p > limit
      ((p * p)..limit).step(p) { |i| candidates[i] = nil }
    end
    candidates.compact
  end
end
