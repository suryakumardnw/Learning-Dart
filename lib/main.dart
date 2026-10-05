void main() {
  removeWhiteSpaces(String string) {
    return string.trim();
  }

  var text = removeWhiteSpaces('   Hey hello!    ');
  print(text);
}
