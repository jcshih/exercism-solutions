const HEX = '0123456789abcdef';

const Hexadecimal = (hex) => {
  hex = hex.match(/^[0-9a-f]+$/) ? hex : 0;

  const toDecimal = () => {
    return [...hex].reduce((acc, d) => Number(HEX.indexOf(d)) + acc*16, 0);
  };

  return { toDecimal };
};

export default Hexadecimal;
