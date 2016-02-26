const filter = (coll, pred, bool) => {
  const result = [];
  for (let i=0; i<coll.length; i++) {
    if (pred(coll[i]) == bool) {
      result.push(coll[i]);
    }
  }
  return result;
};

const strain = {
  keep: (coll, func) => filter(coll, func, true),
  discard: (coll, func) => filter(coll, func, false)
};

export default strain;
