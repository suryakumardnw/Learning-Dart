class Animal {
  final _name;
  final _breed;

  Animal(this._name, this._breed);

  void sound() {
    print("Sound of a Animal !");
  }
}

class Dog extends Animal {
  Dog(super._name, super._breed);

  @override
  sound() {
    print("Woof !");
  }
}

class Cat extends Animal {
  Dog(super._name, super._breed);

  @override
  sound() {
    print("Meow !!");
  }
}
