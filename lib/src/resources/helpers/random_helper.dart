import 'dart:math';

class RandomHelper {
  static final Random _random = Random();

  static int randomInt({int min = 0, int max = 9}) {
    return min + _random.nextInt(max - min);
  }

  static String randomIntString({int length = 1}) {
    String result = '';
    for (int i = 0; i < length; i++) {
      result += randomInt().toString();
    }
    return result;
  }
}
