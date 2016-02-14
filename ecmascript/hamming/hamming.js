class Hamming {
  zip(a, b) {
    return a.map((x, i) => [x, b[i]]);
  }

  compute(a, b) {
    if (a.length != b.length)
      throw new Error('DNA strands must be of equal length.');

    return this.zip([...a], [...b])
      .map(([x, y]) => x != y)
      .filter((x) => x)
      .length;
  }
}

export default Hamming;
