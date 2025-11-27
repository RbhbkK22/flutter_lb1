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
  final nameCtrl = TextEditingController();
  final ageCtrl = TextEditingController();

  String name = '';
  int? age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Example'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                name = '';
                age = 0;
                nameCtrl.clear();
                ageCtrl.clear();
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
            if (name.isNotEmpty && age != null) ... [
              Text('Имя: $name'),
              Text('Возраст: $age'),
            ] else ... [
              SizedBox(
                width: 350,
                child: TextField(
                  controller: nameCtrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Введите ваше ФИО',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: ageCtrl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Введите ваш возраст',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
            if (age == null) ... [
              Text('Вы не указали возраст или указали его не правильно', style: TextStyle(color: Colors.red),)
            ],
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = nameCtrl.text;
                  age = int.tryParse(ageCtrl.text);
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
}
