const LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const NUMBERS = "0123456789";

const randomChar = (chars) => {
  return chars.charAt(Math.floor(Math.random() * chars.length));
};

const generateName = () => {
  let name = "";
  for (let i=0; i<2; i++) name += randomChar(LETTERS);
  for (let i=0; i<3; i++) name += randomChar(NUMBERS);
  return name;
};

const robotNames = new Set();

const assignName = () => {
  let name;
  do {
    name = generateName();
  } while (robotNames.has(name));
  robotNames.add(name);
  return name;
};

class Robot {
  constructor() {
    this.reset();
  }

  get name() {
    return this.robotName;
  }

  reset() {
    this.robotName = assignName();
  }
}

export default Robot;
