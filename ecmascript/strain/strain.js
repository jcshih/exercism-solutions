const strain = {
  keep: (coll, func) => coll.filter(func),
  discard: (coll, func) => coll.filter(x => !func(x))
};

export default strain;
