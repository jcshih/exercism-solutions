const NUMS = {
  ' _ \n| |\n|_|\n   ': '0',
  '   \n  |\n  |\n   ': '1',
  ' _ \n _|\n|_ \n   ': '2',
  ' _ \n _|\n _|\n   ': '3',
  '   \n|_|\n  |\n   ': '4',
  ' _ \n|_ \n _|\n   ': '5',
  ' _ \n|_ \n|_|\n   ': '6',
  ' _ \n  |\n  |\n   ': '7',
  ' _ \n|_|\n|_|\n   ': '8',
  ' _ \n|_|\n _|\n   ': '9'
};

const Ocr = () => {
  const convert = (data) => {
    return split(data).map(x => x.map(n => NUMS[n] || '?').join(''))
                      .join(',');
  };

  return { convert };
};

const split = (data) => {
  const result = [];
  data = data.split('\n');
  for (let row = 0; row < Math.floor(data.length / 4); row++) {
    let rowResult = [];
    for (let i = 0; i < Math.ceil(data[0].length / 3); i++) {
      let num = [0, 1, 2, 3].map(j => data[j+row*4].slice(i*3, (i+1)*3))
                            .join('\n');
      rowResult.push(num);
    }
    result.push(rowResult);
  }
  return result;
};

export default Ocr;
