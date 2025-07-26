import 'dart:math';

int generateRandom8DigitNumber() {
  final random = Random();
  return 10000000 + random.nextInt(90000000);
}
