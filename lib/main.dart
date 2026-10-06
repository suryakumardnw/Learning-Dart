import 'package:surya_learning_dart/scratch/user.dart';

void main() {
  var newUser = User('Surya', "9940180342");
  print(newUser.name);
  newUser.updateMobile = "9940180342";
  print(newUser.mobile);
}

// Create a User class with private variables and public getters/setters.
