void main() {
  var listOfIntegers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  listOfIntegers.removeWhere((integer) => integer.isEven);
  print(listOfIntegers);
}
