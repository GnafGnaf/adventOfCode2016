import 'package:adventofcode/01/compass.dart';
import 'package:adventofcode/01/enums.dart';
import 'package:test/test.dart';

main() {
  test('starts facing given direction', () {
    var compass = new Compass(CardinalDirection.north);
    expect(compass.facingDirection, equals(CardinalDirection.north));
  });

  test('keeps track of the direction you are facing', () {
    var compass = new Compass(CardinalDirection.north);

    compass.turn(Side.right);
    expect(compass.facingDirection, equals(CardinalDirection.east));

    compass.turn(Side.right);
    expect(compass.facingDirection, equals(CardinalDirection.south));

    compass.turn(Side.right);
    expect(compass.facingDirection, equals(CardinalDirection.west));

    compass.turn(Side.right);
    expect(compass.facingDirection, equals(CardinalDirection.north));

    compass.turn(Side.left);
    expect(compass.facingDirection, equals(CardinalDirection.west));
  });
}
