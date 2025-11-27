import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ru', 'RU')],
      locale: const Locale('ru', 'RU'),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final nameCtrl = TextEditingController();
  DateTime now = DateTime.now();
  String age = '';
  String name = '';
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Five Example')),
      body: Center(
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (age.isNotEmpty) ...[Text(name), Text('Сейчас вам $age')],
            buildInput(nameCtrl, 'Введите ваше имя'),
            if (pickedDate != null) ...[
              Text('Ваша дата рождения: ${DateFormat('yyyy-MM-dd').format(pickedDate!).toString()}'),
            ],
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime(1000),
                  lastDate: DateTime(3000),
                  locale: Locale('ru', 'RU'),
                ).then((date) {
                  if (date != null) {
                    setState(() {
                      pickedDate = date;
                    });
                  }
                });
              },
              child: Text('Выбрать дату'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (pickedDate != null) {
                    setState(() {
                      name = nameCtrl.text;
                      age = (now.year - pickedDate!.year).toString();
                    });
                  }
                });
              },
              child: Text('Ввести данные'),
            ),
          ],
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
