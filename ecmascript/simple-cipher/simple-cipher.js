const ALPHA = 'abcdefghijklmnopqrstuvwxyz';

const mod = (x, y) => ((x % y) + y) % y;

const genKey = () => {
  return Array.apply(null, Array(10))
              .map(() => ALPHA[Math.floor(Math.random() * ALPHA.length)])
              .join('');
};

const Cipher = (key = genKey()) => {
  if (!key.match(/^[a-z]+$/)) throw new Error('Bad key');

  const offset = i => ALPHA.indexOf(key[i]);
  const shift = (c, n) => ALPHA[mod(ALPHA.indexOf(c) + n, ALPHA.length)];

  const encode = (plainText) => {
    return [...plainText]
            .map((c, i) => shift(c, offset(i)))
            .join('');
  };

  const decode = (encodedText) => {
    return [...encodedText]
            .map((c, i) => shift(c, -offset(i)))
            .join('');
  };

  return { key, encode, decode };
};

export default Cipher;
