class Pangram {
  constructor(sentence) {
    this.sentence = sentence.toLowerCase();
    this.alphabet = "abcdefghijklmnopqrstuvwxyz";
  }

  isPangram() {
    return [...this.alphabet]
            .map(x => this.sentence.indexOf(x))
            .every(x => x != -1);
  }
}

export default Pangram;
