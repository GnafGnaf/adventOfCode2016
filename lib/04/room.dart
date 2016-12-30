import 'dart:collection';

class Room {
  String _code, _checksum;
  int id;

  Room(String descriptor) {
    _parseDescriptor(descriptor);
    _validateChecksum();
  }

  void _parseDescriptor(String descriptor) {
    _checksum = extractChecksum(descriptor);
    _code = _extractCode(descriptor);
    id = extractId(descriptor);
  }

  int extractId(String descriptor) {
    return int.parse(descriptor.substring(
        descriptor.lastIndexOf(new RegExp('-')) + 1,
        _checksumFormat.firstMatch(descriptor).start));
  }

  String extractChecksum(String descriptor) {
    return descriptor.substring(
        _checksumFormat.firstMatch(descriptor).start + 1,
        _checksumFormat.firstMatch(descriptor).end - 1);
  }

  get _checksumFormat {
    return new RegExp(r'\[\w{5}\]');
  }

  String _extractCode(String descriptor) {
    return descriptor
        .substring(0, descriptor.lastIndexOf(new RegExp('-')))
        .replaceAll(new RegExp('-'), '');
  }

  void _validateChecksum() {
    if (_checksum != _calculateChecksum()) {
      throw new FormatException();
    }
  }

  String _calculateChecksum() {
    var charCounts = _countChars();
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

  Map<String,int> _countChars() {
    var charCounts = new SplayTreeMap<String, int>();
    for (int i = 0; i < _code.length; i++) {
      charCounts.putIfAbsent(_code[i], () => 0);
      charCounts[_code[i]]++;
    }
    return charCounts;
  }
}
