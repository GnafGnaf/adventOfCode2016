import 'dart:math';
import 'package:adventofcode/01/enums.dart';
import 'package:adventofcode/01/streetMap.dart';
import 'package:test/test.dart';

void main() {
  test('start is 0/0', () {
    var map = new StreetMap();

    expect(map.currentPosition, equals(new Point<int>(0, 0)));
  });

  test('position changes as you move across the grid', () {
    var map = new StreetMap();

    map.move(CardinalDirection.north, 1);
    expect(map.currentPosition, equals(new Point<int>(0, 1)));

    map.move(CardinalDirection.south, 1);
    expect(map.currentPosition, equals(new Point<int>(0, 0)));

    map.move(CardinalDirection.east, 1);
    expect(map.currentPosition, equals(new Point<int>(1, 0)));

    map.move(CardinalDirection.west, 1);
    expect(map.currentPosition, equals(new Point<int>(0, 0)));
  });

  test('calculates distance to start point', () {
    StreetMap grid = new StreetMap();

    grid.move(CardinalDirection.east, 2);
    grid.move(CardinalDirection.north, 3);

    expect(grid.distanceToStartPoint(), equals(5));
  });

  test('calculates distance to point first visited twice', () {
    var map = new StreetMap();

    map.move(CardinalDirection.east, 8);
    map.move(CardinalDirection.south, 4);
    map.move(CardinalDirection.west, 4);
    map.move(CardinalDirection.north, 8);

    expect(map.distanceToFirstDoubleVisit(), equals(4));
  });
}
