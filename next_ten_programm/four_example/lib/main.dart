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
  Map<String, int> months = {
    'январь': 31,
    'февраль': 28,
    'март': 31,
    'апрель': 30,
    'май': 31,
    'июнь': 30,
    'июль': 31,
    'август': 31,
    'сентябрь': 30,
    'октябрь': 31,
    'ноябрь': 30,
    'декабрь': 31,
  };

  final monthCtrl = TextEditingController();
  final dayCtrl = TextEditingController();

  bool isTrue = false;
  bool showException = false;

  String month = '';
  int? day = 0;

  @override
  Widget build(BuildContext context) {

    Map<String, String> texts = {
      'isTrue': 'Правда в $month $day дней',
      'isFalse': 'Ложь в $month не $day дней',
      'invalid': 'Заполните все данные',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Four Example'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                month = '';
                day = 0;
                isTrue = false;

                showException = false;
                monthCtrl.clear();
                dayCtrl.clear();
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
            if (month.isNotEmpty && day != null) ... [
              Text(isTrue == true ? texts['isTrue'] ?? '' : texts['isFalse'] ?? ''),
            ] else ... [
              buildInput(monthCtrl, 'Введите месяц'),
              buildInput(dayCtrl, 'Введите количество дней'),
            ],
            if (showException) ... [
              Text(texts['invalid'] ?? '')
            ],
            ElevatedButton(
              onPressed: () {
                setState(() {
                  month = monthCtrl.text.toLowerCase().trim();
                  day = int.tryParse(dayCtrl.text);
                  if (day == null) {
                    showException = true;
                    return;
                  }
                  if (!months.containsKey(month)) {
                    showException = true;
                    return;
                  }
                  isTrue = months[month] == day;
                  showException = false;
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
