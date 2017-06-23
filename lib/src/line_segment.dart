import 'line.dart';
import 'point.dart';

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
