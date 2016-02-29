class CustomSet {
  constructor(arr = []) {
    this.data = {};
    arr.forEach(x => this.data[x] = true);
  }

  delete(x) {
    delete this.data[x];
    return this;
  }

  eql(other) {
    return this.difference(other).size() == 0
        && other.difference(this).size() == 0;
  }

  difference(other) {
    return new CustomSet(Object.keys(this.data).filter(x => !other.data[x]));
  }

  size() {
    return Object.keys(this.data).length;
  }

  disjoint(other) {
    return this.difference(other).size() == this.size();
  }

  empty() {
    return new CustomSet();
  }

  intersection(other) {
    return this.difference(this.difference(other));
  }

  member(x) {
    return !!this.data[x];
  }

  put(x) {
    this.data[x] = true;
    return this;
  }

  subset(other) {
    return other.eql(this.intersection(other));
  }

  toList() {
    return Object.keys(this.data).map(Number);
  }

  union(other) {
    return new CustomSet([...this.toList(), ...other.toList()]);
  }
}

export default CustomSet;
