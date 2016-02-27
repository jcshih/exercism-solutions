function* range(start, end) {
  let i = start;
  while (i <= end)
    yield i++;
}

const sumFunc = (acc, x) => acc + x;

const Squares = (n) => {
  const numbers = [...range(1, n)];
  const sums = numbers.reduce(sumFunc);

  const squareOfSums = sums * sums;
  const sumOfSquares = numbers.map(x => x * x).reduce(sumFunc);
  const difference = squareOfSums - sumOfSquares;

  return { squareOfSums, sumOfSquares, difference };
};

export default Squares;
