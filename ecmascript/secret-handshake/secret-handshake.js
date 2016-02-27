const ACTIONS = [
  "wink", "double blink", "close your eyes", "jump"
];

const SecretHandshake = (code) => {
  if (typeof code !== 'number')
    throw new Error('Handshake must be a number');

  const commands = () => {
    const flags = [...code.toString(2)].reverse();
    const sequence = ACTIONS.filter((_, i) => flags[i] == '1');
    return flags[4] == '1' ? sequence.reverse() : sequence;
  };

  return { commands };
};

export default SecretHandshake;
