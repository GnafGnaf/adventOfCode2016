import 'dart:io';

import 'package:adventofcode/03/triangleValidator.dart';

main() {
  var file = new File('lib/03/input.txt');
  var triangleValidator = new TriangleValidator();
  var validTriangleCount = 0;

  for (var triangle in _parseLines(file.readAsLinesSync())) {
    if (triangleValidator.isSideLengthValid(
        triangle[0], triangle[1], triangle[2])) {
      validTriangleCount++;
    }
  }

  print(validTriangleCount);
}

List<List<int>> _parseLines(List<String> lines) {
  var triangles = [];
  for (var iterator = lines.iterator; iterator.moveNext();) {
    var line1 = _parseLine(iterator.current);
    if (iterator.moveNext()) {
      var line2 = _parseLine(iterator.current);
      if (iterator.moveNext()) {
        var line3 = _parseLine(iterator.current);
        triangles.add([line1[0], line2[0], line3[0]]);
        triangles.add([line1[1], line2[1], line3[1]]);
        triangles.add([line1[2], line2[2], line3[2]]);
      }
    }
  }

  return triangles;
}

List<String> _parseLine(String line) {
  return line
      .trim()
      .split(new RegExp(' +'))
      .map((string) => int.parse(string))
      .toList();
}
