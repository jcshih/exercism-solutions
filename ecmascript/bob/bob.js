class Bob {
  hey(message) {
    message = message.trim();
    if (message.length == 0) {
      return 'Fine. Be that way!';
    } else if (message == message.toUpperCase() && message != message.toLowerCase()) {
      return 'Whoa, chill out!';
    } else if (message.endsWith('?')) {
      return 'Sure.';
    } else {
      return 'Whatever.';
    }
  }
}

export default Bob;

