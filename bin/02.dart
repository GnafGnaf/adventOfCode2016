import 'dart:io';
import 'package:adventofcode/02/enums.dart';
import 'package:adventofcode/02/keypad.dart';

main() async {
  var output = '';
  var keyPad = new KeyPad.specialKeyPad();
  var file = new File('lib/02/input.txt');
  var lines = file.readAsLines();

  for (var line in await lines) {
    for (var direction in _parseLine(line)) {
      keyPad.moveFinger(direction);
    }
    output += keyPad.keyUnderFinger.value;
  }

  print(output);
}

List<Directions> _parseLine(String line) {
  var directions = [];

  for (var i = 0; i < line.length; i++) {
    switch (line[i].toUpperCase()) {
      case 'U':
        directions.add(Directions.up);
        break;
      case 'D':
        directions.add(Directions.down);
        break;
      case 'L':
        directions.add(Directions.left);
        break;
      case 'R':
        directions.add(Directions.right);
        break;
    }
  }

  return directions;
}
