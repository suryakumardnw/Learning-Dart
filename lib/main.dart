void main() {
  List<int> listOfIntegers = [2, 3, 4, 5];
  listOfIntegers.add(6);
  listOfIntegers.removeLast();
  var newList = listOfIntegers.map((e) => e * 2);
  print(newList);
}
