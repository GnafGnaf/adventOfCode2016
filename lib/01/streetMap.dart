import 'dart:math';
import 'package:adventofcode/01/enums.dart';

class StreetMap {
  Point<int> position = new Point<int>(0, 0);
  List<Point<int>> positionsVisited = [];

  StreetMap() {
    // Make sure starting point is in history
    positionsVisited.add(position);
  }

  void move(CardinalDirection direction, int numberOfBlocks) {
    for (int i = 0; i < numberOfBlocks; i++) {
      switch (direction) {
        case CardinalDirection.north:
          position += new Point<int>(0, 1);
          break;
        case CardinalDirection.east:
          position += new Point<int>(1, 0);
          break;
        case CardinalDirection.south:
          position -= new Point<int>(0, 1);
          break;
        case CardinalDirection.west:
          position -= new Point<int>(1, 0);
          break;
      }
      positionsVisited.add(position);
    }
  }

  int distanceToStartPoint() {
    return position.x.abs() + position.y.abs();
  }

  int distanceToFirstDoubleVisit() {
    var firstDoubleVisit = _firstDoubleVisit();
    return firstDoubleVisit.x.abs() + firstDoubleVisit.y.abs();
  }

  Point _firstDoubleVisit()
  {
    for (var visitedPosition in positionsVisited) {
      if (_isDoubleVisit(visitedPosition)) {
        return visitedPosition;
      }
    }
  }

  bool _isDoubleVisit(Point<int> visitedPosition) {
    return positionsVisited.indexOf(visitedPosition)
        != positionsVisited.lastIndexOf(visitedPosition);
  }
}