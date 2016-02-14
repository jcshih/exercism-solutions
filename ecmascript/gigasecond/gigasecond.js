const delta = 1000000000000;

class Gigasecond {
  constructor(d) {
    this.d = d;
  }

  date() {
    return new Date(this.d.getTime() + delta);
  }
}

export default Gigasecond;
