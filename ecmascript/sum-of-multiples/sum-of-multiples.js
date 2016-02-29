function* range(start, end) {
  let i = start;
  while (i < end)
    yield i++;
}

const SumOfMultiples = (factors = [3, 5]) => {
  return {
    to: (n) => {
      return [...range(1, n)]
              .filter(x => factors.some(y => x % y == 0))
              .reduce((acc, x) => acc + x, 0);
    }
  };
};

export default SumOfMultiples;
