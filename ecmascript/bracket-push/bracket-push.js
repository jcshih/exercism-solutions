const OPENING = ['(', '[', '{'];
const CLOSING = [')', ']', '}'];

const bracket = ([...str]) => {
  const stack = [];
  for (let i = 0; i < str.length; i++) {
    let b = str[i];
    if (OPENING.indexOf(b) >= 0) {
      stack.push(b);
    } else {
      if (OPENING.indexOf(stack.pop()) != CLOSING.indexOf(b))
        return false;
    }
  }
  return stack.length == 0 ? true : false;
};

export default bracket;
