import 'dart:io';

import 'package:adventofcode/04/room.dart';

class Main {
  File inputFile;

  Main(String pathToInputFile) {
    inputFile = new File(pathToInputFile);
  }

  execute() {
    inputFile.readAsLines();

    var idSum = 0;

    for (var roomDescriptor in inputFile.readAsLinesSync()) {
      try {
        var room = new Room(roomDescriptor);
        idSum += room.id;
      } catch (FormatException) {

      }
    }
    return idSum;
  }
}
