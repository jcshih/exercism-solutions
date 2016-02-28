const OPERATORS = new RegExp(/(plus|minus|divided by|multiplied by)/g);
const OPERANDS = new RegExp(/-?\d+/g);

const WordProblem = (question) => {
  const operators = question.match(OPERATORS);
  const operands = question.match(OPERANDS);

  const evaluate = (op, x, y) => {
    switch (op) {
      case 'plus':
        return x + y;
      case 'minus':
        return x - y;
      case 'multiplied by':
        return x * y;
      case 'divided by':
        return x / y;
    }
  };

  const answer = () => {
    if (!operators || !operands) throw new ArgumentError();

    let result = +operands[0];
    for (let i=1, j=0; i<operands.length; i++, j++) {
      result = evaluate(operators[j], result, +operands[i]);
    }
    return result;
  };

  return { answer };
};

const ArgumentError = () => ({
  name: "Argument Error",
  message: "error"
});

export default { WordProblem, ArgumentError };
