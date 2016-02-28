function generate({ minFactor = 1, maxFactor = Number.MAX_VALUE }) {
  const palindromes = [];
  for (let i = minFactor; i <= maxFactor; i++) {
    for (let j = i; j <= maxFactor; j++) {
      let candidate = i * j;
      if (isPalindrome(candidate))
        palindromes[candidate] = [i, j];
    }
  }

  return {
    largest: {
      value: palindromes.length - 1,
      factors: palindromes[palindromes.length - 1]
    },
    smallest: {
      value: palindromes.findIndex(x => x),
      factors: palindromes.find(x => x)
    }
  };
}

const isPalindrome = (n) => {
  n = n.toString();
  return n.split('').reverse().join('') === n;
};

export default generate;
