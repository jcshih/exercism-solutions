const DEFAULT_LINKS = { prev: null, next: null };

const Element = (val, { prev: prev, next: next } = DEFAULT_LINKS) => {
  return { val, prev, next };
};

const LinkedList = () => {
  let head = null,
      tail = null,
      size = 0;

  const push = (val) => {
    head
      ? tail = tail.next = new Element(val, { prev: tail })
      : head = tail = new Element(val);
    size++;
  };

  const pop = () => {
    if (size == 0) return undefined;

    const val = tail.val;
    if (tail.prev) tail.prev.next = null;
    tail = tail.prev;
    if (!tail) head = null;
    size--;

    return val;
  };

  const unshift = (val) => {
    head
      ? head = head.prev = new Element(val, { next: head })
      : head = tail = new Element(val);
    size++;
  };

  const shift = () => {
    if (size == 0) return undefined;

    const val = head.val;
    if (head.next) head.next.prev = null;
    head = head.next;
    if (!head) tail = null;
    size--;

    return val;
  };

  const remove = (val) => {
    let current = head;
    while (current) {
      if (current.val == val) {
        current.prev
          ? current.prev.next = current.next
          : head = head.next;
        current.next
          ? current.next.prev = current.prev
          : tail = tail.prev;
        size--;
        break;
      }
      current = current.next;
    }
  };

  return {
    push, pop, unshift, shift,
    delete: remove,
    count: () => size
  };
};

export default LinkedList;
