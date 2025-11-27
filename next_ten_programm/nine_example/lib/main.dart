import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int? num;
  int numLess = 0;
  int numMore = 0;
  int sumNum = 0;

  final numCtrl = TextEditingController();

  String result = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              buildInput(numCtrl, 'Введите число'),
              if (result.isNotEmpty) ...[Text(result)],
              ElevatedButton(
                onPressed: () {
                  num = int.tryParse(numCtrl.text);

                  if (num == null) {
                    return;
                  }

                  numLess = num! - 1;
                  numMore = num! + 1;
                  sumNum = num! + numLess + numMore;

                  setState(() {
                    result = '$numLess, $num, $numMore, $sumNum,';
                  });
                },
                child: Text('Вывести последовательность'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInput(TextEditingController controller, String hint) {
    return SizedBox(
      width: 350,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
