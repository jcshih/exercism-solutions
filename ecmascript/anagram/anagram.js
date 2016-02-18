const encode = (word) => {
  return [...word].sort().join('');
};

class Anagram {
  constructor(word) {
    this.word = word.toLowerCase();
    this.signature = encode(this.word);
  }

  matches(words) {
    if (words.constructor !== Array) {
      words = Array.prototype.slice.call(arguments);
    }

    return words
           .filter(w => this.word != w.toLowerCase())
           .filter(w => this.signature == encode(w.toLowerCase()));
  }
}

export default Anagram;
