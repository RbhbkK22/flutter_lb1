import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        home: MainScreen()
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ageCtrl = TextEditingController();
  String yearOfBirth = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Five Example'),
      ),
      body: Center(
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (yearOfBirth.isNotEmpty) ...[
              Text(yearOfBirth),
            ],

            buildInput(ageCtrl, 'Введите ваш возраст'),

            ElevatedButton(
              onPressed: () {
                DateTime now = DateTime.now();
                final age = int.tryParse(ageCtrl.text);
                if (age != null) {
                  setState(() {
                    yearOfBirth = 'Вы родились в ${now.year - age} году';
                  });
                }
              },
              child: Text('Узнать год рождения'),
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
