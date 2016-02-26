function* range(start, end) {
  let i = start;
  while (i <= end)
    yield i++;
}

const primesTo = (limit) => {
  const candidates = [null, null, ...range(2, limit)];
  for (let i=2; i*i<=limit; i++) {
    if (candidates[i] == null) continue;
    for (let j=2; i*j<=limit; j++) {
      candidates[i*j] = null;
    }
  }
  return candidates.filter(x => x != null);
};

const Sieve = (limit) => ({
  primes: primesTo(limit)
});

export default Sieve;
