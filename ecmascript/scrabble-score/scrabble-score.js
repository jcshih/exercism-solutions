const SCORES = {
  1: ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
  2: ["D", "G"],
  3: ["B", "C", "M", "P"],
  4: ["F", "H", "V", "W", "Y"],
  5: ["K"],
  8: ["J", "X"],
  10: ["Q", "Z"]
};

const LETTER_SCORES = Object.keys(SCORES)
  .map(n => SCORES[n].map(c => [c, n]))
  .reduce((acc, x) => acc.concat(x), [])
  .reduce((acc, [c, n]) => { acc[c] = Number(n); return acc; }, {});

const score = (word) => {
  return [...(word || '').toUpperCase()].reduce((acc, x) => acc + LETTER_SCORES[x], 0);
};

export default score;
