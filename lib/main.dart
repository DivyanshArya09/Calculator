import 'package:calculator/home_page.dart';
import 'package:calculator/logics/calculations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Calculations(),
      child: MaterialApp(
        title: 'Calculator',
        theme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
