class PhoneNumber {
  constructor(num) {
    const digits = num.match(/\d/g).join('');
    if (digits.length == 10) {
      this.num = digits;
    } else if (digits.length == 11 && digits.startsWith('1')) {
      this.num = digits.slice(1);
    } else {
      this.num = '0000000000';
    }
  }

  number() {
    return this.num;
  }

  areaCode() {
    return this.num.slice(0, 3);
  }

  toString() {
    return `(${this.areaCode()}) ${this.num.slice(3, 6)}-${this.num.slice(6, 10)}`;
  }
}

export default PhoneNumber;
