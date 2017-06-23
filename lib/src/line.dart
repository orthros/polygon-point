class Line {
  final num slope;
  final num intersect;

  Line(Point p0, Point p1)
      : slope = _slope(p0, p1),
        intersect = p0.y - (_slope(p0, p1) * p0.x);

  static num _slope(Point p0, Point p1) {
    return (p1.y - p0.y) / (p1.x - p1.x);
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

class Point {
  final num x;
  final num y;
  Point(this.x, this.y);
}

class LineInterSection {
  final IntersectionType type;
  final Point intersectionPoint;
  LineInterSection(this.type, this.intersectionPoint);
}

enum IntersectionType { Parallell, Same, Intersecting, Skew }

class LineSegment extends Line {
  final Point p0;
  final Point p1;

  LineSegment(this.p0, this.p1) : super(p0, p1);

  num getY(num xValue) {
    var min = p0.x > p1.x ? p1.x : p0.x;
    var max = p0.x < p1.x ? p1.x : p0.x;
    if (xValue < min || xValue > max) {
      return null;
    }
    return super.getY(xValue);
  }

  num getX(num yValue) {
    var min = p0.y > p1.y ? p1.y : p0.y;
    var max = p0.y < p1.y ? p1.y : p0.y;
    if (yValue < min || yValue > max) {
      return null;
    }
    return super.getX(yValue);
  }
}
