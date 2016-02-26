const accumulate = (coll, func) => {
  const result = [];
  for (let i=0; i<coll.length; i++) {
    result.push(func(coll[i]));
  }
  return result;
};

export default accumulate;
