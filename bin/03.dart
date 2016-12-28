import 'dart:io';

import 'package:adventofcode/03/triangle.dart';

main() {
  var file = new File('lib/03/input.txt');
  var triangles = [];

  for (var line in file.readAsLinesSync()) {
    var sides = line.trim().split(new RegExp(' +'));

    try {
      triangles.add(new Triangle(
          int.parse(sides[0]),
          int.parse(sides[1]),
          int.parse(sides[2])
      ));

    } catch (ArgumentError) {
      print('ignored $sides');
    }
  }

  print(triangles.length);
}