import 'package:adventofcode/03/triangle.dart';
import 'package:test/test.dart';

main() {
  test('does sanity checks on creation', () {
    expect(() {new Triangle(5, 10, 25);}, throwsArgumentError);
    expect(() {new Triangle(5, 10, 12);}, isNot(throwsArgumentError));
  });
}