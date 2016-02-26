const ALLERGENS = [
  'eggs', 'peanuts', 'shellfish', 'strawberries',
  'tomatoes', 'chocolate', 'pollen', 'cats'
];

class Allergies {
  constructor(score) {
    this.score = score;
  }

  list() {
    return ALLERGENS.filter((_, i) => this.score & 2**i);
  }

  allergicTo(allergen) {
    return this.list().includes(allergen);
  }
}

export default Allergies;
