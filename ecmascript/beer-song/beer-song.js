const bottles = (n) => {
  switch (n) {
    case 0: return `no more bottles`;
    case -1: return '99 bottles';
    default: return `${n} bottle${n==1 ? '' : 's'}`
  }
};

const capitalize = (s) => {
  return s.charAt(0).toUpperCase() + s.slice(1);
};

const takeDown = (n) => {
  switch (n) {
    case 0: return 'Go to the store and buy some more';
    case 1: return 'Take it down and pass it around';
    default: return 'Take one down and pass it around';
  }
};

const start = (n) => {
  return `${capitalize(bottles(n))} of beer on the wall, ${bottles(n)} of beer.`;
};

const end = (n) => {
  return `${takeDown(n)}, ${bottles(n-1)} of beer on the wall.`;
};

class Beer {
  static verse(n) {
    return [].concat(start(n)).concat(end(n)).concat('').join('\n');
  }

  static sing(a = 99, b = 0) {
    const verses = [];
    for (let i=a; i>=b; i--) {
      verses.push(this.verse(i));
    }
    return verses.join('\n');
  }
}

export default Beer;
