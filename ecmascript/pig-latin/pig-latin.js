const PIG_LATIN_REGEXP = /^(s?ch|thr?|s?qu|[^aeiou])?(.*)/;

const PigLatin = () => {
  const translate = text => text.split(' ').map(pigLatinify).join(' ');
  const pigLatinify = word => word.replace(PIG_LATIN_REGEXP, '$2$1ay');

  return { translate };
};

export default PigLatin;
