function* genNumbers(start, increment) {
  let i = start;
  while (true) {
    yield i;
    i+=increment;
  }
}

const genPrimes = (n) => {
  const primes = [2];
  let i = 1;
  let candidates = genNumbers(3, 2);
  while (i < n) {
    let cand = candidates.next().value;
    if (primes.every(p => cand % p != 0)) {
      primes.push(cand);
      i++;
    }
  }
  return primes;
};

const Prime = () => {
  const nth = (n) => {
    if (n < 1) throw new Error('Prime is not possible');
    const primes = genPrimes(n);
    return primes[primes.length - 1];
  };

  return { nth };
};

export default Prime;
