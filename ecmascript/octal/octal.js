const Octal = (oct) => {
  if (!oct.match(/^[0-7]+$/)) oct = '0';

  return {
    toDecimal: () => {
      return [...oct].reduce((acc, d) => +d + acc*8, 0)
    }
  };
};

export default Octal;
