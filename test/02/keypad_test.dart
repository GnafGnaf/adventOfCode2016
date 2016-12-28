import 'package:adventofcode/02/enums.dart';
import 'package:adventofcode/02/keypad.dart';
import 'package:test/test.dart';

void main() {
  test('starts with finger on 5', () {
    var keypad = new KeyPad.standardKeyPad();

    expect(keypad.keyUnderFinger.value, equals("5"));
  });

  test('move finger', () {
    var keypad = new KeyPad.standardKeyPad();

    keypad.moveFinger(Directions.left);
    expect(keypad.keyUnderFinger.value, equals("4"));

    keypad.moveFinger(Directions.up);
    expect(keypad.keyUnderFinger.value, equals("1"));

    keypad.moveFinger(Directions.right);
    expect(keypad.keyUnderFinger.value, equals("2"));

    keypad.moveFinger(Directions.down);
    expect(keypad.keyUnderFinger.value, equals("5"));
  });

  test("don't move finger out of keypad bounds", () {
    var keypad = new KeyPad.standardKeyPad();

    keypad.moveFinger(Directions.left);
    keypad.moveFinger(Directions.left);
    keypad.moveFinger(Directions.up);
    keypad.moveFinger(Directions.up);

    expect(keypad.keyUnderFinger.value, equals("1"));

    keypad.moveFinger(Directions.down);
    keypad.moveFinger(Directions.down);
    keypad.moveFinger(Directions.down);
    keypad.moveFinger(Directions.right);
    keypad.moveFinger(Directions.right);
    keypad.moveFinger(Directions.right);

    expect(keypad.keyUnderFinger.value, equals("9"));
  });

  test('special KeyPad', () {
    var keyPad = new KeyPad.specialKeyPad();

    keyPad.moveFinger(Directions.up);
    keyPad.moveFinger(Directions.left);
    keyPad.moveFinger(Directions.left);
    expect(keyPad.keyUnderFinger.value, equals("5"));

    keyPad.moveFinger(Directions.right);
    keyPad.moveFinger(Directions.right);
    keyPad.moveFinger(Directions.down);
    keyPad.moveFinger(Directions.down);
    keyPad.moveFinger(Directions.down);
    expect(keyPad.keyUnderFinger.value, equals("D"));

    keyPad.moveFinger(Directions.left);
    keyPad.moveFinger(Directions.up);
    keyPad.moveFinger(Directions.right);
    keyPad.moveFinger(Directions.down);
    keyPad.moveFinger(Directions.left);
    expect(keyPad.keyUnderFinger.value, equals("B"));

    keyPad.moveFinger(Directions.up);
    keyPad.moveFinger(Directions.up);
    keyPad.moveFinger(Directions.up);
    keyPad.moveFinger(Directions.up);
    keyPad.moveFinger(Directions.down);
    expect(keyPad.keyUnderFinger.value, equals("3"));
  });
}
