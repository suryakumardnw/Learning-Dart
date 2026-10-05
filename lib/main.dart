void main() {
  isVowelOrConsonant(string) {
    if (string is! String) return "Invalid Input";
    var vowels = ['a', 'e', 'i', 'o', 'u'];
    return vowels.contains(string.toLowerCase()) ? 'Vowel' : 'Consonant';
  }

  print(isVowelOrConsonant('a'));
  print(isVowelOrConsonant('v'));
}
