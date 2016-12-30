import 'package:adventofcode/04/roomCode.dart';
import 'package:test/test.dart';

main() {
  group('calculateChecksum', () {
      test('checksum is 5 most common chars', () {
        expect(
            (new RoomCode('not-a-real-room')).calculateChecksum(),
            equals('oarel')
        );
      });

      test('if count is equal, sort alphabetically', () {
        expect(
            (new RoomCode('a-b-c-d-e-f-g-h')).calculateChecksum(),
            equals('abcde')
        );
        expect(
            (new RoomCode('aaaaa-bbb-z-y-x')).calculateChecksum(),
            equals('abxyz')
        );
      });
  });
}