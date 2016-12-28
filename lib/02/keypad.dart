import 'package:adventofcode/02/enums.dart';
import 'package:adventofcode/02/key.dart';

class KeyPad {
  Key keyUnderFinger;

  KeyPad.standardKeyPad() {
    var key1 = new Key("1");
    var key2 = new Key("2");
    var key3 = new Key("3");
    var key4 = new Key("4");
    var key5 = new Key("5");
    var key6 = new Key("6");
    var key7 = new Key("7");
    var key8 = new Key("8");
    var key9 = new Key("9");

    key1.connect(right: key2, bottom: key4);
    key2.connect(left: key1, right: key3, bottom: key5);
    key3.connect(left: key2, bottom: key6);
    key4.connect(top: key1, right: key5, bottom: key7);
    key5.connect(top: key2, left: key4, right: key6, bottom: key8);
    key6.connect(top: key3, left: key5, bottom: key9);
    key7.connect(top: key4, right: key8);
    key8.connect(top: key5, left: key7, right: key9);
    key9.connect(top: key6, left: key8);

    keyUnderFinger = key5;
  }

  KeyPad.specialKeyPad() {
    var key1 = new Key("1");
    var key2 = new Key("2");
    var key3 = new Key("3");
    var key4 = new Key("4");
    var key5 = new Key("5");
    var key6 = new Key("6");
    var key7 = new Key("7");
    var key8 = new Key("8");
    var key9 = new Key("9");
    var keyA = new Key("A");
    var keyB = new Key("B");
    var keyC = new Key("C");
    var keyD = new Key("D");

    key1.connect(bottom: key3);
    key2.connect(right: key3, bottom: key6);
    key3.connect(top: key1, left: key2, right: key4, bottom: key7);
    key4.connect(left: key3, bottom: key8);
    key5.connect(right: key6);
    key6.connect(top: key2, left: key5, right: key7, bottom: keyA);
    key7.connect(top: key3, left: key6, right: key8, bottom: keyB);
    key8.connect(top: key4, left: key7, right: key9, bottom: keyC);
    key9.connect(left: key8);
    keyA.connect(top: key6, right: keyB);
    keyB.connect(top: key7, left: keyA, right: keyC, bottom: keyD);
    keyC.connect(top: key8, left: keyB);
    keyD.connect(top: keyB);

    keyUnderFinger = key5;
  }

  void moveFinger(Directions direction) {
    switch (direction) {
      case Directions.up:
        if (keyUnderFinger.hasTop()) {
          keyUnderFinger = keyUnderFinger.top;
        }
        break;
      case Directions.down:
        if (keyUnderFinger.hasBottom()) {
          keyUnderFinger = keyUnderFinger.bottom;
        }
        break;
      case Directions.left:
        if (keyUnderFinger.hasLeft()) {
          keyUnderFinger = keyUnderFinger.left;
        }
        break;
      case Directions.right:
        if (keyUnderFinger.hasRight()) {
          keyUnderFinger = keyUnderFinger.right;
        }
        break;
    }
  }
}
