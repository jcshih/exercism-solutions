class Luhn {
  constructor(num) {
    this.num = num;
  }

  get checkDigit() { return this.num % 10; }

  get addends() {
    return [...String(this.num)]
            .reverse()
            .map((d, i) => i%2==0 ? +d : +d*2)
            .map(d => d>10 ? d-9 : d)
            .reverse()
  };

  get checksum() { return this.addends.reduce((acc, d) => acc + d); }

  get valid() { return this.checksum % 10 == 0; }

  static create(num) {
    let luhnNum,
        i = 0;
    do {
      luhnNum = new Luhn(num * 10 + i);
      i++;
    } while (!luhnNum.valid);
    return luhnNum.num;
  }
};

export default Luhn;
