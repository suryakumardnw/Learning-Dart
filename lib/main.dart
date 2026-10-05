void main() {
  int number = -23;
  bool isNegativeNumber(int num) {
    return num.isNegative ? true : false;
  }

  switch (number) {
    case int number when number == 0:
      print('Zero');
    case int number when !isNegativeNumber(number):
      print('Positive');
    case int number when isNegativeNumber(number):
      print('Negative');
  }
}
