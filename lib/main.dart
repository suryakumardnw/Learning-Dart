void main() {
  printNumsWhichAreNotDivisibleByFive() {
    for (var i = 1; i <= 100; i++) {
      if (i % 5 == 0) continue;
      print(i);
    }
  }

  printNumsWhichAreNotDivisibleByFive();
}
