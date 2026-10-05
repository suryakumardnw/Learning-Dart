void main() {
  isPrimeNumber(int number) {
    if (number <= 1) return false;
    for (var i = 2; i * i <= number; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  print(isPrimeNumber(29));
}
