const generateRows = (initialRow, n) => {
  let row = initialRow;
  const result = [row];
  for (let i = 0; i < n - 1; i++) {
    let nextRow = generateRow(row);
    result.push(nextRow);
    row = nextRow;
  }
  return result;
};

const generateRow = (row) => {
  row = [0, ...row, 0];
  const result = [];
  for (let i=0, j=1; j<row.length; i++, j++) {
    result.push(row[i] + row[j]);
  }
  return result;
};

const Triangle = (numRows) => {
  const rows = generateRows([1], numRows);
  const lastRow = rows[rows.length - 1];

  return { rows, lastRow };
};

export default Triangle;
