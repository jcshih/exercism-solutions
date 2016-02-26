const FACTORS = {
  3: 'Pling',
  5: 'Plang',
  7: 'Plong'
};

class Raindrops {
  convert(n) {
    return Object.keys(FACTORS)
      .reduce((acc, f) => {
        return n % f == 0 ? acc.concat(FACTORS[f]) : acc;
      }, "") || n.toString();
  }
}

export default Raindrops;
