import 'dart:collection';

class RoomCode {
  String _code;

  RoomCode(String code) {
    _code = code.replaceAll(new RegExp('-'), '');
  }

  String calculateChecksum() {
    var charCounts = _countCodeCharOccurrences();
    var checksum = '';
    for (var i = 0; i < 5; i++) {
      var currentMostCommon = _extractMostCommon(charCounts);
      charCounts.remove(currentMostCommon);
      checksum += currentMostCommon;
    }
    return checksum;
  }

  String _extractMostCommon(charCounts) {
    var currentMostCommon = charCounts.keys.first;
    charCounts.forEach((char, count) {
      if (charCounts[currentMostCommon] < count) {
        currentMostCommon = char;
      }
    });
    return currentMostCommon;
  }

  Map<String, int> _countCodeCharOccurrences() {
    var charCounts = new SplayTreeMap<String, int>();
    for (int i = 0; i < _code.length; i++) {
      charCounts.putIfAbsent(_code[i], () => 0);
      charCounts[_code[i]]++;
    }
    return charCounts;
  }
}