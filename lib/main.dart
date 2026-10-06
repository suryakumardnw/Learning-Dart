import 'dart:math';

void main() {
  print(maxNumber(5, 2, 10));
}

maxNumber(int a, int b, int c) {
  var maxNum = [a, b, c];
  maxNum.sort((a, b) => a.compareTo(b));
  return maxNum.last;
}
