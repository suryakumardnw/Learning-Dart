void main() {
  convertStringToIntOrDouble(String string) {
    try {
      var parsedStr = string.contains('.')
          ? double.parse(string)
          : int.parse(string);
      print(parsedStr);
    } catch (e) {
      print(e);
    }
  }

  convertStringToIntOrDouble('10');
}
