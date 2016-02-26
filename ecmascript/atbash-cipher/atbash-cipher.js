const sanitize = (str) => {
  return str.replace(/\W/g, '').toLowerCase();
};

const convert = (c) => {
  const charCode = c.charCodeAt(c);
  if (charCode >= 97 && charCode <= 122) {
    return String.fromCharCode(122 + 97 - charCode);
  } else {
    return c;
  }
};

const chunk = (arr, n) => {
  const result = [];
  for (let i=0; i<Math.ceil(arr.length / n); i++) {
    result.push(arr.slice(i*n, (i+1)*n));
  }
  return result;
};

const atbash = {
  encode: (str) => {
    const chunks = chunk([...sanitize(str)]
                          .map(convert), 5)
                          .map(x => x.join(''));
    return chunks.join(' ');
  }
};

export default atbash;
