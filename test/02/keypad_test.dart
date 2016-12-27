import 'package:adventofcode/02/enums.dart';
import 'package:adventofcode/02/keypad.dart';
import 'package:test/test.dart';

void main() {
  test('starts with finger on 5', () {
    var keypad = new KeyPad();

    expect(keypad.currentNumber, equals(5));
  });

  test('move finger', () {
    var keypad = new KeyPad();

    keypad.moveFinger(Directions.left);
    expect(keypad.currentNumber, equals(4));

    keypad.moveFinger(Directions.up);
    expect(keypad.currentNumber, equals(1));

    keypad.moveFinger(Directions.right);
    expect(keypad.currentNumber, equals(2));

    keypad.moveFinger(Directions.down);
    expect(keypad.currentNumber, equals(5));
  });

  test("don't move finger out of keypad bounds", () {
    var keypad = new KeyPad();

    keypad.moveFinger(Directions.left);
    keypad.moveFinger(Directions.left);
    keypad.moveFinger(Directions.up);
    keypad.moveFinger(Directions.up);

    expect(keypad.currentNumber, equals(1));

    keypad.moveFinger(Directions.down);
    keypad.moveFinger(Directions.down);
    keypad.moveFinger(Directions.down);
    keypad.moveFinger(Directions.right);
    keypad.moveFinger(Directions.right);
    keypad.moveFinger(Directions.right);

    expect(keypad.currentNumber, equals(9));
  });
}