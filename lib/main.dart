import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp (
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF0A0E21),
        ),
      ),
      home: const InputPage(),
    );
  }
}
