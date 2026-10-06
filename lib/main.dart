void main() {
  Bottle bottle = Bottle.create();
  bottle.open();
}

abstract class Bottle {
  factory Bottle.create() {
    return CokeBottle();
  }
  void open();
}

class CokeBottle implements Bottle {
  @override
  open() {
    print("Coke bottle is Opened !");
  }
}

// Create an interface called Bottle and add a method to it called open(). Create a class called CokeBottle and implement the Bottle and print the message “Coke bottle is opened”. Add a factory constructor to Bottle and return the object of CokeBottle. Instantiate CokeBottle using the factory constructor and call the open() on the object.
