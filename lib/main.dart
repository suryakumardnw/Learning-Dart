void main() {
  printTables(int n) {
    int times = 1;
    while (times <= n) {
      for (var i = 1; i <= 10; i++) {
        print("$times X $i = ${times * i}");
      }
      times++;
    }
    ;
  }

  printTables(10);
}
