const DEFAULT_STARTING_POSITION = {
  white: [0, 3],
  black: [7, 3]
};

const Queens = ({ white: white, black: black }= DEFAULT_STARTING_POSITION) => {
  const board = placePieces(blankBoard(), [['W', white], ['B', black]]);

  const canAttack = () => {
    if (white[0] == black[0] || white[1] == black[1])
      return true;
    return Math.abs(white[0] - black[0]) == Math.abs(white[1] - black[1]);
  };

  return {
    white, black, board,
    toString: () => board.join('\n') + '\n',
    canAttack
  };
};

const blankBoard = () => [...Array(8).keys()].map(_ => '_ '.repeat(8).trim());

const placePieces = (board, pieces) => {
  pieces.forEach(([p, [x, y]]) => {
    board[x] = board[x].slice(0, y * 2) + p + board[x].slice(y * 2 + 1);
  });
  return board;
};

export default Queens;
