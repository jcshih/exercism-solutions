class Words {
  count(str) {
    const counts = str.trim().split(/\s+/);
    return counts.reduce((acc, word) => {
      if (acc.hasOwnProperty(word)) {
        acc[word]++;
      } else {
        acc[word] = 1;
      }
      return acc;
    }, {});
  }
}

export default Words;
