const at = (hr, min) => {
  const time = {
    hr: hr,
    min: min || 0
  };

  const formatTime = () => {
    const pad = (s) => "00".substring(0, 2 - s.length) + s;
    const hour = pad(time.hr.toString());
    const minute = pad(time.min.toString());
    return `${hour}:${minute}`;
  };

  const addMinutes = (minutesToAdd) => {
    const totalMinutes = (time.hr * 60 + time.min + minutesToAdd + 1440) % 1440;
    const hours = Math.floor(totalMinutes / 60);
    const minutes = totalMinutes % 60;
    time.hr = hours;
    time.min = minutes;
  };

  return {
    time: time,
    toString: () => formatTime(),
    plus: function(minutes) { addMinutes(minutes); return this; },
    minus: function(minutes) { addMinutes(-minutes); return this; },
    equals: (other) => time.hr == other.time.hr && time.min == other.time.min
  };
};

export default at;
