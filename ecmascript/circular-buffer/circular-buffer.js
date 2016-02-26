const CircularBuffer = (size) => {
  let buffer = [];
  const bufferSize = size;

  const read = () => {
    if (buffer.length == 0) throw bufferEmptyException();
    return buffer.shift();
  };

  const write = (val) => {
    if (buffer.length >= bufferSize) throw bufferFullException();
    if (val === undefined || val === null) return;
    buffer.push(val);
  };

  const forceWrite = (val) => {
    if (buffer.length >= bufferSize) read();
    write(val);
  };

  const clear = () => {
    buffer = [];
  };

  return { read, write, forceWrite, clear };
};

const bufferFullException = () => ({
  name: 'Buffer Full Exception',
  message: 'Cannot write to full buffer'
});

const bufferEmptyException = () => ({
  name: 'Buffer Empty Exception',
  message: 'Cannot read from empty buffer'
});

export {
  CircularBuffer as default,
  bufferFullException,
  bufferEmptyException
};
