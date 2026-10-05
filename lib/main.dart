void main() {
  void pascalsTriangle(int numRows) {
    if (numRows <= 0) return;

    List<List<int>> numsList = [
      [1],
    ];

    for (int i = 1; i < numRows; i++) {
      List<int> previousRow = numsList[i - 1];
      List<int> currentRow = [1];
      for (int j = 1; j < i; j++) {
        int sum = previousRow[j - 1] + previousRow[j];
        currentRow.add(sum);
      }

      currentRow.add(1);
      numsList.add(currentRow);
    }

    for (var row in numsList) {
      print(row);
    }
  }

  pascalsTriangle(5);
}
