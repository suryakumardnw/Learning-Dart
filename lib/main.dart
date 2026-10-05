void main() {
  var obj = {"name": 'Surya', "age": 24};

  obj["name"] = "kumar";
  var name = obj["name"];
  obj.putIfAbsent("country", () => "India");
  print(name);
  print(obj);
}
