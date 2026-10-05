void main() {
  calculateReachTime(double distance, double speed) {
    return distance / speed;
  }

  double distance = 23;
  double speed = 40;
  var reachTime = calculateReachTime(distance, speed);
  print(reachTime);
}
