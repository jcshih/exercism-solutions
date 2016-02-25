class School {
  constructor() {
    this.db = {};
  }

  roster() {
    return clone(this.db);
  }

  add(studentName, gradeLevel) {
    if (gradeLevel in this.db) {
      this.db[gradeLevel].push(studentName);
      this.db[gradeLevel].sort();
    } else {
      this.db[gradeLevel] = [ studentName ];
    }
  }

  grade(gradeLevel) {
    return this.db[gradeLevel] ? clone(this.db[gradeLevel]) : [];
  }
}

const clone = (obj) => JSON.parse(JSON.stringify(obj));

export default School;
