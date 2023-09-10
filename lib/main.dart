import 'package:flutter/material.dart';
import 'package:flutter_crud_back4app/screens/home_screen.dart';
import 'package:flutter_crud_back4app/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Cep',
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
