class School {
  constructor() {
    this.db = {};
  }

  roster() {
    return JSON.parse(JSON.stringify(this.db));
  }

  add(name, id) {
    if (id in this.db) {
      this.db[id].push(name);
      this.db[id].sort();
    } else {
      this.db[id] = [ name ];
    }
  }

  grade(n) {
    return this.db[n] || [];
  }
}

export default School;
