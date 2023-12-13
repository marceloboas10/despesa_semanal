import 'package:despesas_pessoais/home_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 154, 15, 181),
          titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              color: Colors.white, 
              fontSize: 20,
              fontWeight: FontWeight.bold),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
