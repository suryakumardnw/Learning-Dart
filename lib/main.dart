void main() {
  divideANumber(int a, int b) {
    try {
      return a ~/ b;
    } catch (e) {
      print(e);
    }
  }

  print(divideANumber(10, 5));
  print(divideANumber(5, 0));
}
