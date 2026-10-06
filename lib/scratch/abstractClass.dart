import 'dart:math';

abstract class Shape {
  static areaOfRectangle({double length = 1, double width = 1}) {
    return length * width;
  }

  static areaOfSquare({double sides = 1}) {
    return sides * sides;
  }

  static areaOfTriangle({double base = 1, double height = 1}) {
    return (1 / 2) * base * height;
  }

  static areaOfCircle({double radius = 1}) {
    return pi * (radius * radius);
  }
}
