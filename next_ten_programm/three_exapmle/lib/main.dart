import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final dayCtrl = TextEditingController();
  final monthCtrl = TextEditingController();
  final dayNumCtrl = TextEditingController();

  String day = '';
  String month = '';
  String dayNum = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Three Example'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                day = '';
                month = '';
                dayNum = '';

                dayCtrl.clear();
                monthCtrl.clear();
                dayNumCtrl.clear();
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (day.isNotEmpty && month.isNotEmpty && dayNum.isNotEmpty) ... [
              Text('Сегодня $day, $dayNum $month'),
            ] else ... [
              buildInput(dayCtrl, 'Введите название текущего дня'),
              buildInput(monthCtrl, 'Введите название текущего месяца'),
              buildInput(dayNumCtrl, 'Введите номер текущего дня'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    day = dayCtrl.text;
                    month = monthCtrl.text;
                    dayNum = dayNumCtrl.text;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Нажми на меня',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget buildInput(TextEditingController controller,String hint) {
    return  SizedBox(
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
