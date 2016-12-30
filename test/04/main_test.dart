import 'package:test/test.dart';
import 'package:adventofcode/04/main.dart';

main() {
  test('end 2 end test', () async {
    var program = new Main('test/04/testInput.txt');
    expect(program.execute(), equals(1514));
  });
}
