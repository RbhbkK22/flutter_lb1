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
  DateTime now = DateTime.now();
  String age = '';

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
            if (age.isNotEmpty) ...[
              Text('Сейчас вам $age'),
            ],
            ElevatedButton(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1000),
                  lastDate: DateTime(3000),
                  locale: Locale('ru', 'RU'),
                );
                if (date != null) {
                  setState(() {
                    age = (now.year - date.year).toString();
                  });
                } else {
                  return;
                }

              },
              child: Text('Выбрать дату'),
            ),
          ],
        ),
      ),
    );
  }
}
