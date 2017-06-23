import 'intersection_type.dart';
import 'line_intersection.dart';
import 'point.dart';

class Line {
  final num slope;
  final num intersect;

  Line(Point p0, Point p1)
      : slope = _slope(p0, p1),
        intersect = p0.y - (_slope(p0, p1) * p0.x);

  static num _slope(Point p0, Point p1) {
    return (p1.y - p0.y) / (p1.x - p0.x);
  }

  num getY(num xValue) {
    return slope * xValue + intersect;
  }

  num getX(num yValue) {
    return (yValue - intersect) / slope;
  }

  LineInterSection getIntersection(Line other) {
    if (this.slope == other.slope) {
      if (this.intersect == other.intersect) {
        return new LineInterSection(IntersectionType.Same, null);
      }
      return new LineInterSection(IntersectionType.Parallell, null);
    }
    var xValue =
        (other.intersect - this.intersect) / (this.slope - other.slope);

    return new LineInterSection(
        IntersectionType.Intersecting, new Point(xValue, getY(xValue)));
  }
}
