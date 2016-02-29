const TwoBucket = (b1, b2, goal, starterBucket) => {
  const startingAmount = starterBucket == 'one' ? b1 : b2;
  const bucket1 = {
    capacity: startingAmount,
    quantity: startingAmount,
    name: starterBucket
  };
  const bucket2 = {
    capacity: bucket1.capacity == b1 ? b2 : b1,
    quantity: 0,
    name: starterBucket == 'one' ? 'two' : 'one'
  };
  let moves = 1;

  while (bucket1.quantity != goal && bucket2.quantity != goal) {
    if (bucket1.quantity == 0) {
      bucket1.quantity = bucket1.capacity;
    } else if (bucket2.quantity == bucket2.capacity) {
      bucket2.quantity = 0;
    } else {
      let amount = Math.min(bucket1.quantity,
                            bucket2.capacity - bucket2.quantity);
      bucket1.quantity -= amount;
      bucket2.quantity += amount;
    }
    moves++;
  }

  const goalBucket = bucket1.quantity == goal ? bucket1 : bucket2;
  const otherBucket = goalBucket.capacity == bucket1.capacity
                    ? bucket2 : bucket1;

  return {
    moves: () => moves,
    goalBucket: goalBucket.name,
    otherBucket: otherBucket.quantity
  };
};

export default TwoBucket;
