void main() {
  factorialOfNumber(int number) {
    if (number == 0) return 1;
    return number * factorialOfNumber(number - 1);
  }

  print(factorialOfNumber(5));
}
