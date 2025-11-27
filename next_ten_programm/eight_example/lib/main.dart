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
  final numA = TextEditingController();

  final numB = TextEditingController();

  String sumRes = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Eight Example'),),
        body: Center(
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildInput(numA, 'Число а'),
              Text('+'),
              buildInput(numB, 'Число b'),
              if (sumRes.isNotEmpty) ... [
                Text(sumRes)
              ],
              ElevatedButton(
                onPressed: () {
                  final intNumA = int.tryParse(numA.text);
                  final intNumB = int.tryParse(numB.text);
                  if (intNumA != null && intNumB != null) {
                    setState(() {
                      sumRes = 'a + b = ${intNumA + intNumB}';
                    });
                  }
                },
                child: Text('Узнать результат'),
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
