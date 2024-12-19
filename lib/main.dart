import 'package:flutter/material.dart';
import 'layout/home/homepage_with_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomepageWithMenu(), // Pastikan ini sesuai dengan nama class di file terkait
    );
  }
}
