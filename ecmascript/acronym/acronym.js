const Acronyms = {
  parse: str => str.match(/[A-Z]+[a-z]*|[a-z]+/g)
                   .reduce((acc, word) => acc.concat(word.charAt(0)), "")
                   .toUpperCase()
};

export default Acronyms;
