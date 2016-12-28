class Key {
  Key top, bottom, left, right;
  String value;

  Key(String this.value);

  bool hasTop() => top != null;
  bool hasBottom() => bottom != null;
  bool hasLeft() => left != null;
  bool hasRight() => right != null;

  void connect({Key top, Key bottom, Key left, Key right}) {
    this.top = top;
    this.bottom = bottom;
    this.left = left;
    this.right = right;
  }
}
