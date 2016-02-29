const Matrix = (data) => {
  const rows = data.split('\n').map(r => r.trim().split(' ').map(Number));
  const columns = rows[0].map((_, i) => rows.map(r => r[i]));

  const saddlePoints = () => {
    const result = [];
    for (let i = 0; i < rows.length; i++) {
      for (let j = 0; j < columns.length; j++) {
        if (rows[i][j] >= Math.max(...rows[i]) &&
            rows[i][j] <= Math.min(...columns[j]))
          result.push([i, j]);
      }
    }
    return result;
  }();

  return { rows, columns, saddlePoints };
};

export default Matrix;
