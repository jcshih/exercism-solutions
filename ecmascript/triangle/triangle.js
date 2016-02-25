class Triangle {
  constructor(...sides) {
    this.sides = sides;
  }

  kind() {
    if (this.isInvalid()) throw new Error('Not a triangle');
    if (this.isEquilateral()) return 'equilateral';
    if (this.isIsosceles()) return 'isosceles';
    return 'scalene';
  }

  isInvalid() {
    if (!this.validSides() || !this.satisfyTriangleInequality())
      return true;
    return false;
  }

  validSides() {
    return this.sides.every(x => x > 0);
  }

  satisfyTriangleInequality() {
    const [a, b, c] = this.sides;
    return a+b>=c && a+c>=b && b+c>=a;
  }

  isEquilateral() {
    return new Set(this.sides).size == 1;
  }

  isIsosceles() {
    return new Set(this.sides).size == 2;
  }
}

export default Triangle;
