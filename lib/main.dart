void main() {
  var myHouse = House(1, "Surya's House", 25000);
  var nareshHouse = House(2, "Naresh's Hosue", 50000);
  var balajiHouse = House(3, "Balaji's House", 550000);
  var Houses = [myHouse, nareshHouse, balajiHouse];
  print(Houses);
}

class House {
  final int id;
  final String name;
  final int price;

  House(this.id, this.name, this.price);
}

// Write a dart program to create a class House with properties [id, name, price]. Create a constructor of it and create 3 objects of it. Add them to the list and print all details.
