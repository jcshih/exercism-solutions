const DEFAULT_KIDS = [
  'Alice', 'Bob', 'Charlie', 'David',
  'Eve', 'Fred', 'Ginny', 'Harriet',
  'Ileana', 'Joseph', 'Kincaid', 'Larry'
];

const PLANT_CODES = {
  'G': 'grass',
  'C': 'clover',
  'R': 'radishes',
  'V': 'violets'
};

const Garden = (diagram, kids = DEFAULT_KIDS) => {
  diagram = diagram.split('\n');
  kids = kids.sort();

  const assignPlants = (k) => {
    const i = kids.indexOf(k) * 2;
    const plants = diagram.map(x => x.slice(i, i + 2)).join('');
    return [...plants].map(p => PLANT_CODES[p]);
  };

  const attrs = {};
  for (let kid of kids) {
    attrs[kid.toLowerCase()] = assignPlants(kid);
  }
  return attrs;
};

export default Garden;
