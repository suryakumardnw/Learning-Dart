void main() {
  divideANumber(int a, int b) {
    try {
      return a ~/ b;
    } catch (e) {
      throw CustomException("Suya");
    }
  }

  print(divideANumber(10, 5));
  print(divideANumber(5, 0));
}

class CustomException implements Exception {
  final String message;
  CustomException([this.message = 'Custom Request Timed Out!']);

  @override
  String toString() => 'Custom Exception $message';
}
