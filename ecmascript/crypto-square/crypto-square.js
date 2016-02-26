class Crypto {
  constructor(str) {
    this.str = str;
  }

  normalizePlaintext() {
    return this.str.replace(/\W/g, '').toLowerCase();
  }

  size() {
    return Math.ceil(Math.sqrt(this.normalizePlaintext().length));
  }

  plaintextSegments() {
    const plaintext = this.normalizePlaintext();
    const size = this.size();
    const result = [];
    for (let i=0; i<Math.ceil(plaintext.length / size); i++) {
      result.push(plaintext.slice(i*size, (i+1)*size));
    }
    return result;
  }

  ciphertext() {
    const segments = this.plaintextSegments();
    let result = '';
    for (let i=0; i<segments[0].length; i++) {
      for (let j=0; j<segments.length; j++) {
        result += segments[j][i] || '';
      }
    }
    return result;
  }
}

export default Crypto;
