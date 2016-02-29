const DAYS = [
  'Sunday', 'Monday', 'Tuesday', 'Wednesday',
  'Thursday', 'Friday', 'Saturday'
];

const meetupDay = (y, m, d, s) => {
  const numDays = new Date(y, m + 1, 0).getDate();
  const candidates = Array(numDays).fill()
    .map((_, i) => i + 1)
    .filter(day => new Date(y, m, day).getDay() == DAYS.indexOf(d));
  const date = matchSchedule(candidates, s);

  if (!date) throw new Error;

  return new Date(y, m, date);
};

const matchSchedule = (candidates, schedule) => {
  return {
    '1st': candidates[0],
    '2nd': candidates[1],
    '3rd': candidates[2],
    '4th': candidates[3],
    '5th': candidates[4],
    'last': candidates[candidates.length - 1],
    'teenth': candidates.find(d => d >= 13 && d <= 19)
  }[schedule];
};

export default meetupDay;
