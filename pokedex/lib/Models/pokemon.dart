import 'package:flutter/widgets.dart';
import 'package:pokedex/Models/Colors/pokemons_colors.dart';
import 'package:pokedex/Utils/strings.dart';

class Pokemon {
  final int id;
  final String name;
  final String description;
  final String image;
  final int height;
  final int weight;
  final Color color;
  final List<String> types;
  final List<String> moves;

  const Pokemon({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.height,
    required this.weight,
    required this.color,
    required this.types,
    required this.moves,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: capitalize(json['name']),
      image: json['sprites']['other']['dream_world']['front_default'],
      height: json['height'],
      weight: json['weight'],
      moves:
          (json['abilities'] as List<dynamic>).map((e) => e['ability']['name'] as String).toList(),
      types:
          (json['types'] as List<dynamic>).map((e) => e['type']['name'] as String).toList(),
      color: PokemonsNames.values.byName(json['name']).color,
      description: json['description']
    );
  }

  String getCode() {
    return '#${id < 10 ? '00' : (id < 100 ? '0' : '')}${id.toString()}';
  }
}