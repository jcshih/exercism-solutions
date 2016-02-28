const ONES = {
  0: 'zero', 1: 'one', 2: 'two', 3: 'three', 4: 'four', 5: 'five',
  6: 'six', 7: 'seven', 8: 'eight', 9: 'nine', 10: 'ten',
  11: 'eleven', 12: 'twelve', 13: 'thirteen', 14: 'fourteen', 15: 'fifteen',
  16: 'sixteen', 17: 'seventeen', 18: 'eighteen', 19: 'nineteen'
};

const TENS = {
  2: 'twenty', 3: 'thirty', 4: 'forty', 5: 'fifty',
  6: 'sixty', 7: 'seventy', 8: 'eighty', 9: 'ninety'
};

const BIG = [null, 'thousand', 'million', 'billion'];

const Say = () => {
  const inEnglish = (n) => {
    if (n < 0 || n >= Math.pow(10, 12))
      throw new Error('Number must be between 0 and 999,999,999,999.');
    if (n == 0) return 'zero';

    const segments = rchunk([...n.toString()], 3).map(x => x.join(''));
    return segments.map(x => convertHundreds(+x))
                   .map((x, i) => x ? `${x}${BIG[i] ? ' ' + BIG[i] : ''}` : '')
                   .reverse()
                   .filter(x => x)
                   .join(' ')
                   .trim();
  };

  return { inEnglish };
};

const convertHundreds = (n) => {
  let result = '';
  let [div, mod] = divmod(n, 100);
  if (div > 0) {
    result += `${ONES[div]} hundred${mod>0 ? ' ': ''}`;
  }
  if (mod > 0) {
    result += convertTens(mod);
  }

  return result;
};

const convertTens = (n) => {
  if (n < 20) return ONES[n];

  let result = '';
  let [div, mod] = divmod(n, 10);
  result += `${TENS[div]}`;
  if (mod > 0) {
    result += `-${ONES[mod]}`;
  }

  return result;
};

const divmod = (n, x) => {
  const div = Math.floor(n / x);
  const mod = n % x;
  return [div, mod];
};

const rchunk = (arr, n) => {
  const len = arr.length;
  const result = [];
  for (let i = 0; i < Math.ceil(len / n); i++) {
    let start = len - (i + 1) * n;
    start = start >= 0 ? start : 0;
    let end = len - (i * n);
    result.push(arr.slice(start, end));
  }
  return result;
};

export default Say;
