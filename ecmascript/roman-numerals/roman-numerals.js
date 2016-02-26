const NUMERALS = {
  1000 : 'M',
  900  : 'CM',
  500  : 'D',
  400  : 'CD',
  100  : 'C',
  90   : 'XC',
  50   : 'L',
  40   : 'XL',
  10   : 'X',
  9    : 'IX',
  5    : 'V',
  4    : 'IV',
  1    : 'I'
};

const toRoman = (num) => {
  return Object.keys(NUMERALS)
    .sort((a, b) => b - a)
    .map(n => {
      const div = Math.floor(num / n);
      num = num % n;
      return NUMERALS[n].repeat(div);
    }).join('');
};

export default toRoman;
