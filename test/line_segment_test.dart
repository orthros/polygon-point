import '../lib/src/intersection_type.dart';
import '../lib/src/line.dart';
import '../lib/src/line_intersection.dart';
import '../lib/src/line_segment.dart';
import '../lib/src/point.dart';
import 'package:test/test.dart';

main() {
  test('Line Segment Inside Bounds', () {
    Point p0 = new Point(0, 0);
    Point p1 = new Point(1, 1);
    LineSegment l1 = new LineSegment(p0, p1);
    expect(l1.slope, 1);
    expect(l1.intersect, 0);

    for (num i = 0; i < 1; i += .1) {
      expect(l1.getX(i), i);
      expect(l1.getY(i), i);
    }
  });

  test('Line Segment Outside Bounds', () {
    Point p0 = new Point(0, 0);
    Point p1 = new Point(1, 1);
    LineSegment l1 = new LineSegment(p0, p1);
    expect(l1.slope, 1);
    expect(l1.intersect, 0);

    //These are OUTSIDE the bounds
    expect(l1.getX(2), null);
    expect(l1.getY(2), null);
  });
}
