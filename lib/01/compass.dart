import 'package:adventofcode/01/enums.dart';

class Compass {
  CardinalDirection facingDirection;

  Compass(this.facingDirection);

  void turn(Side toSide) {
    if (toSide == Side.left) {
      _turnLeft();
    } else {
      _turnRight();
    }
  }

  void _turnRight() {
    if (facingDirection == CardinalDirection.values.last) {
      facingDirection = CardinalDirection.values.first;
    } else {
      facingDirection = CardinalDirection.values[facingDirection.index + 1];
    }
  }

  void _turnLeft() {
    if (facingDirection == CardinalDirection.values.first) {
      facingDirection = CardinalDirection.values.last;
    } else {
      facingDirection = CardinalDirection.values[facingDirection.index -1];
    }
  }
}