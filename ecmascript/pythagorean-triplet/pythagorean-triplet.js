const triplet = (...sides) => {
  const sum = () => sides.reduce((acc, s) => acc + s, 0);
  const product = () => sides.reduce((acc, s) => acc * s, 1);
  const isPythagorean = () => {
    const [a, b, c] = sides;
    return a*a + b*b == c*c;
  };

  return { sum, product, isPythagorean };
};

class Triplet {
  constructor(...sides) {
    return triplet(...sides);
  }

  static where(params) {
    const result = [];
    const { minFactor: min, maxFactor: max, sum } = params;

    for (let a = min || 2; a <= max; a++) {
      for (let b = a + 1; b <= max; b++) {
        for (let c = b + 1; c <= max; c++) {
          let t = triplet(a, b, c);
          if (t.isPythagorean() && (sum ? t.sum() == sum : true))
            result.push(t);
        }
      }
    }

    return result;
  }
}

export default Triplet;
