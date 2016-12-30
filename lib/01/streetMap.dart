import 'dart:math';
import 'package:adventofcode/01/enums.dart';

class StreetMap {
  Point<int> currentPosition = new Point<int>(0, 0);
  List<Point<int>> positionsVisited = [];

  StreetMap() {
    // Make sure starting point is in history
    positionsVisited.add(currentPosition);
  }

  void move(CardinalDirection direction, int numberOfBlocks) {
    for (int i = 0; i < numberOfBlocks; i++) {
      switch (direction) {
        case CardinalDirection.north:
          currentPosition += new Point<int>(0, 1);
          break;
        case CardinalDirection.east:
          currentPosition += new Point<int>(1, 0);
          break;
        case CardinalDirection.south:
          currentPosition -= new Point<int>(0, 1);
          break;
        case CardinalDirection.west:
          currentPosition -= new Point<int>(1, 0);
          break;
      }
      positionsVisited.add(currentPosition);
    }
  }

  int distanceToStartPoint() {
    return _taxicabDistance(currentPosition);
  }

  int distanceFromStartToFirstDoubleVisit() {
    var firstDoubleVisit = _firstDoubleVisit();

    if (firstDoubleVisit != null) {
      return _taxicabDistance(firstDoubleVisit);
    }

    return null;
  }

  int _taxicabDistance(Point position) => position.x.abs() + position.y.abs();

  Point _firstDoubleVisit() {
    for (var position in positionsVisited) {
      if (_hasBeenVisitedMoreThanOnce(position)) {
        return position;
      }
    }
    return null;
  }

  bool _hasBeenVisitedMoreThanOnce(Point<int> position) {
    return positionsVisited.indexOf(position) !=
        positionsVisited.lastIndexOf(position);
  }
}
