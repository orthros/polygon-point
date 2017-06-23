import '../lib/src/intersection_type.dart';
import '../lib/src/line.dart';
import '../lib/src/line_intersection.dart';
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

  test('Line Parallel', () {
    Line l1 = new Line(new Point(0, 0), new Point(1, 1));
    Line l2 = new Line(new Point(0, 1), new Point(1, 2));
    LineInterSection intersection = l1.getIntersection(l2);

    expect(intersection.type, IntersectionType.Parallell);
  });

  test('Line Intersect', () {
    Line l1 = new Line(new Point(0, 0), new Point(1, 1));
    Line l2 = new Line(new Point(0, 1), new Point(1, 1));
    LineInterSection intersection = l1.getIntersection(l2);

    expect(intersection.type, IntersectionType.Intersecting);
    expect(intersection.intersectionPoint.x, 1);
    expect(intersection.intersectionPoint.y, 1);
  });

  test('Line Same', () {
    Line l1 = new Line(new Point(0, 0), new Point(1, 1));
    Line l2 = new Line(new Point(2, 2), new Point(3, 3));
    LineInterSection intersection = l1.getIntersection(l2);

    expect(intersection.type, IntersectionType.Same);
  });
}
