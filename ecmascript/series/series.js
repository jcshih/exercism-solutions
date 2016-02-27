const Series = (str) => {
  const digits = [...str].map(Number);

  const slices = (n) => {
    if (digits.length < n)
      throw new Error('Slice size is too big.');

    const result = [];
    for (let i=0; i<digits.length-n+1; i++) {
      result.push(digits.slice(i, i + n));
    }
    return result;
  };

  return { digits, slices };
};

export default Series;
