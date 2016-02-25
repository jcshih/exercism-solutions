import BigInt from './big-integer';

class Grains {
  square(n) {
    return BigInt(2).pow(n-1).toString();
  }

  total() {
    let result = BigInt(0);
    for (let i=1; i<=64; i++) {
      result = result.add(this.square(i));
    }
    return result.toString();
  }
}

export default Grains;
