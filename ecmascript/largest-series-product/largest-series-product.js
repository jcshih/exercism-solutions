const Series = (numbers) => {
  const digits = [...numbers].map(Number);

  const slices = (n) => {
    if (n > digits.length) throw new Error('Slice size is too big.');

    const result = [];
    for (let i=0; i<digits.length-n+1; i++) {
      result.push(digits.slice(i, i+n));
    }
    return result;
  };

  const largestProduct = (n) => {
    const product = nums => nums.reduce((acc, x) => acc * x, 1);
    const segments = slices(n).map(product);
    return Math.max(...segments);
  };

  return { digits, slices, largestProduct };
};

export default Series;
