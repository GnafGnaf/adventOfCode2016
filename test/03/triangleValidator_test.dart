import 'package:adventofcode/03/triangleValidator.dart';
import 'package:test/test.dart';

main() {
  test('does sanity checks', () {
    var triangleValidator = new TriangleValidator();

    expect(triangleValidator.isSideLengthValid(5, 10, 25), isFalse);
    expect(triangleValidator.isSideLengthValid(5, 10, 12), isTrue);
  });
}