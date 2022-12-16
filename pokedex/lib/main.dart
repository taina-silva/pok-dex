import 'package:flutter/material.dart';
import 'package:pokedex/Models/Colors/general_colors.dart';
import 'Screens/splash.dart';

void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      theme: ThemeData(backgroundColor: Colors.black),
      home: Scaffold(backgroundColor: GeneralColors.background, body: const SplashScreen()),
    );
  }
}