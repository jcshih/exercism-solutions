const Matrix = (data) => {
  const rows = data.split('\n')
                   .map(row => row.split(' ').map(Number));

  const columns = rows[0].map((_, i) => rows.map(row => row[i]));

  return { rows, columns };
};

export default Matrix;
