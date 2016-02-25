const transform = (input) => {
  return Object.keys(input).reduce((output, score) => {
    const letters = input[score].reduce((acc, letter) => {
      return {
        ...acc,
        [letter.toLowerCase()]: Number(score)
      };
    }, {});
    return {
      ...output,
      ...letters
    };
  }, {});
};

export default transform;
