void main() {
  print(calculate(2, 5, add));
  print(calculate(2, 3, multiply));
  print(calculate(20, 5, divide));
}

int add(int a, int b) {
  return a + b;
}

int multiply(int a, int b) {
  return a * b;
}

int divide(int a, int b) {
  return a ~/ b;
}

int calculate(int a, int b, int Function(int, int) add) {
  return add(a, b);
}
