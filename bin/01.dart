import 'package:adventofcode/01/compass.dart';
import 'package:adventofcode/01/enums.dart';
import 'package:adventofcode/01/streetMap.dart';

void main(List<String> directions) {
  Compass compass = new Compass(CardinalDirection.north);
  StreetMap map = new StreetMap();
  for (var direction in directions) {
    compass.turn(_extractSide(direction));
    map.move(compass.facingDirection, _extractDistance(direction));
  }

  print("You will be ${map.currentPosition.y} blocks East "
      "and ${map.currentPosition.x} blocks North, "
      "or ${map.distanceToStartPoint()} blocks away.");

  print("The first spot you visited twice is "
      "${map.distanceToFirstDoubleVisit()} away");
}

int _extractDistance(String direction) {
  return int.parse(direction.replaceAll(',', '').substring(1));
}

Side _extractSide(String direction) {
  switch (direction.substring(0, 1).toUpperCase()) {
    case 'L':
      return Side.left;
    case 'R':
      return Side.right;
    default:
      throw new ArgumentError('$direction');
  }
}
