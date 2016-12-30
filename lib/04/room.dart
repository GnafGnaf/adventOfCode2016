import 'package:adventofcode/04/roomCode.dart';

class Room {
  RoomCode _code;
  String _checksum;
  int id;

  Room(String descriptor) {
    id = extractId(descriptor);
    _checksum = extractChecksum(descriptor);
    _code = new RoomCode(_extractCode(descriptor));

    if (_checksum != _code.calculateChecksum()) {
      throw new FormatException();
    }
  }

  int extractId(String descriptor) {
    return int.parse(descriptor.substring(
        descriptor.lastIndexOf(new RegExp('-')) + 1,
        descriptor.indexOf(new RegExp(r'\['))));
  }

  String extractChecksum(String descriptor) {
    return descriptor.substring(
        (new RegExp(r'\[\w{5}\]')).firstMatch(descriptor).start + 1,
        (new RegExp(r'\[\w{5}\]')).firstMatch(descriptor).end - 1);
  }

  String _extractCode(String descriptor) {
    return descriptor.substring(0, descriptor.lastIndexOf(new RegExp('-')));
  }
}
