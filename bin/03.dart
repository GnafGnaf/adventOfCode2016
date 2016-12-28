import 'dart:io';

import 'package:adventofcode/03/triangleValidator.dart';

main() {
  var file = new File('lib/03/input.txt');
  var triangleValidator = new TriangleValidator();
  var validTriangleCount = 0;

  for (var line in file.readAsLinesSync()) {
    var sides = line.trim().split(new RegExp(' +'));

      if (triangleValidator.isSideLengthValid(
          int.parse(sides[0]),
          int.parse(sides[1]),
          int.parse(sides[2]))
      ) {
        validTriangleCount++;
      }

  }

  print(validTriangleCount);
}