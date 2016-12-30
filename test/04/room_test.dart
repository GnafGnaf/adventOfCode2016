import 'package:adventofcode/04/room.dart';
import 'package:test/test.dart';

main() {
  test('validates room descriptor', () {
    expect(() {
      new Room('totally-real-room-200[decoy]');
    }, throwsFormatException);
  });

  test('return Id', () {
    expect((new Room('aaaaa-bbb-z-y-x-123[abxyz]')).id, equals(123));
    expect((new Room('a-b-c-d-e-f-g-h-987[abcde]')).id, equals(987));
    expect((new Room('not-a-real-room-404[oarel]')).id, equals(404));
  });
}
