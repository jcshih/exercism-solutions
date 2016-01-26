class Prime
  def nth(n)
    fail ArgumentError, 'n must be postive integer' unless n > 0

    primes = [2]
    (3..Float::INFINITY).step(2).each { |e|
      break primes.last if primes.size >= n
      primes << e unless primes
                         .take_while { |p| p * p <= e }
                         .any? { |p| e % p == 0 }
    }
  end
end
