class primeFactors {
  for(num) {
    const factors = [];
    let f = 2;
    while (num > 1) {
      if (num % f == 0) {
        factors.push(f);
        num /= f;
      } else {
        f++;
      }
    }
    return factors;
  }
};

export default primeFactors;
