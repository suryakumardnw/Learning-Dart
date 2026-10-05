import 'dart:io';

void main() {
  displayRightAngleTriangle(int num) {
    for (var i = 1; i <= num; i++) {
      for (var j = 1; j <= i; j++) {
        stdout.write('$j ');
      }
      print(' ');
    }
  }

  displayRightAngleTriangle(5);
}
