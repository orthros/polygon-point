import '../lib/src/line.dart';
import '../lib/src/point.dart';
import 'package:test/test.dart';

main() {
  test('Line Slope', () {
    Point p0 = new Point(0, 0);
    Point p1 = new Point(1, 1);
    Line l1 = new Line(p0, p1);
    expect(l1.slope, 1);
    expect(l1.intersect, 0);
    for (int i = -10; i < 10; i++) {
      expect(l1.getX(i), i);
      expect(l1.getY(i), i);
    }
  });
}
