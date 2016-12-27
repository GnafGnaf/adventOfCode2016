import 'package:adventofcode/02/enums.dart';

class KeyPad {
  Map<String, int> fingerPosition = {'col': 1, 'row': 1};

  final List<List<int>> keyPad = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];

  int get currentNumber => keyPad[fingerPosition['row']][fingerPosition['col']];

  void moveFinger(Directions direction) {
    switch (direction) {
      case Directions.up:
        if (fingerPosition['row'] > 0) {
          fingerPosition['row']--;
        }
        break;
      case Directions.down:
        if (fingerPosition['row'] < 2) {
          fingerPosition['row']++;
        }
        break;
      case Directions.left:
        if (fingerPosition['col'] > 0) {
          fingerPosition['col']--;
        }
        break;
      case Directions.right:
        if (fingerPosition['col'] < 2) {
          fingerPosition['col']++;
        }
        break;
    }
  }
}