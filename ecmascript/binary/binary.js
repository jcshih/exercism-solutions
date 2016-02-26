class Binary {
  constructor(bin) {
    bin = bin.match(/^[01]+$/) ? bin : 0;
    this.bin = parseInt(bin, 2);
  }

  toDecimal() {
    return Number(this.bin.toString(10));
  }
}

export default Binary;
