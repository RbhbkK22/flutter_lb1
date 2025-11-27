import 'dart:io';

class Example2 {
  static void doExample() {
    int number = 100;
    print("number: $number");
    number = number * 2;
    print("number * 2: $number");
    print('\n');
  }
}

class Example3 {
  static void doExample() {
    int s;
    int d;
    s = 10;
    d = 20;
    if (s < d) {
      print("S < D");
    }
    s = s * 2;
    if (s == d) {
      print("S = D");
    }
    s = s * d;
    if (s > d) {
      print("S > D");
    }
    print('\n');

  }
}

class Example4 {
  static void doExample() {
    bool userInputNumber = false;
    while (!userInputNumber) {
      int number = 0;
  
      stdout.write('Input a number: ');
      String numStr = stdin.readLineSync() ?? '';

      try {
        number = int.parse(numStr);
        userInputNumber = true;
      } catch (_) {
        continue;
      }
      print("Your number $number");
    }
    print('\n');
  }
}

class Example5 {
  static void doExample() {
    bool userInputNumber = false;
    while (!userInputNumber) {
      String name = '';
      int age = 0;
      double height = 0;

      stdout.write('Input name: ');
      name = stdin.readLineSync() ?? '';

      stdout.write('Input age: ');
      String ageStr = stdin.readLineSync() ?? '';

      stdout.write('Input height: ');
      String heightStr = stdin.readLineSync() ?? '';

      try {
        age = int.parse(ageStr);
        height = double.parse(heightStr);
        userInputNumber = true;
      } catch (_) {
        continue;
      }
      print("Your Name $name");
      print("Your Age $age");
      print("Your Height $height");
    }

    print('\n');
  }
}
