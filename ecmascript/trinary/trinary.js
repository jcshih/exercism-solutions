class Trinary {
  constructor(num) {
    this.num = num.match(/^[0-2]+$/) ? num : 0;
  }

  toDecimal() {
    return [...this.num].reduce((acc, d) => Number(d) + acc*3, 0);
  }
}

export default Trinary;
