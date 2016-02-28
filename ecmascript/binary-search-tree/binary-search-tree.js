class BinarySearchTree {
  constructor(data, left = null, right = null) {
    this.data = data;
    this.left = left;
    this.right = right;
  }

  insert(val) {
    let { data, left, right } = this;
    if (val <= data) {
      left
        ? left.insert(val)
        : this.left = new BinarySearchTree(val);
    } else {
      right
        ? right.insert(val)
        : this.right = new BinarySearchTree(val);
    }
  }

  each(func) {
    const { left, right, data } = this;
    if (left) left.each(func);
    func(data);
    if (right) right.each(func);
  }
}

export default BinarySearchTree;
