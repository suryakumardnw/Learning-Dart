void main() {
  var names = [
    "Naresh",
    "Balaji",
    "Surya",
    "Abishek",
    "Sanjay",
    "Arjun",
    "Ram",
    "Nazeer",
    "Karthi",
    "Merlin",
  ];
  names.sort();
  print(names);
  names.sort((a, b) => b.toLowerCase().compareTo(a.toLowerCase()));
  print(names);
}
