const BEARINGS = ['north', 'east', 'south', 'west'];
const INSTRUCTIONS = {
  L: 'turnLeft',
  R: 'turnRight',
  A: 'advance'
};

class Robot {
  orient(dir) {
    if (BEARINGS.indexOf(dir) < 0) throw 'Invalid Robot Bearing';
    this.bearing = dir;
  }

  turnRight() {
    this.bearing = BEARINGS[(BEARINGS.indexOf(this.bearing) + 1) % 4];
  }

  turnLeft() {
    this.bearing = BEARINGS[(BEARINGS.indexOf(this.bearing) + 3) % 4];
  }

  at(x, y) {
    this.coordinates = [x, y];
  }

  advance() {
    const [x, y] = this.coordinates;
    this.coordinates = {
      'north': [x, y+1],
      'east':  [x+1, y],
      'south': [x, y-1],
      'west':  [x-1, y]
    }[this.bearing];
  }

  instructions(seq) {
    return [...seq].map(x => INSTRUCTIONS[x]);
  }

  place({ x: x, y: y, direction: direction }) {
    this.at(x, y);
    this.orient(direction);
  }

  evaluate(seq) {
    this.instructions(seq).forEach(x => this[x]());
  }
}

export default Robot;
