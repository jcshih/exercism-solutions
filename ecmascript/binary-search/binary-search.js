const isSorted = (arr) => {
  for (let i=1; i<arr.length; i++) {
    if (arr[i-1] > arr[i]) return false;
  }
  return true;
};

const BinarySearch = (arr) => {
  const array = isSorted(arr) ? arr : undefined;

  const indexOf = (val, start = 0, end = array.length) => {
    if (start >= end) return -1;
    const mid = Math.floor((start + end) / 2);
    if (val == array[mid]) return mid;
    if (val < array[mid]) {
      return indexOf(val, start, mid);
    } else {
      return indexOf(val, mid + 1, end);
    }
  };

  return { array, indexOf };
};

export default BinarySearch;
