import 'package:flutter/material.dart';
import 'package:pokedex/Screens/pokemon_details.dart';
import 'package:pokedex/Screens/pokemons_list.dart';

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
      home: Scaffold(body: PokemonsListScreen()),
    );
  }
}