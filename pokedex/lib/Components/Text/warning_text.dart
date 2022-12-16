import 'package:flutter/material.dart';
import 'package:pokedex/Models/Colors/general_colors.dart';
import 'package:pokedex/State/pokemons_list_store.dart';

class WarningText extends StatelessWidget {
  final String? message;
  const WarningText({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? singletonPokemonListStore.warningMessage ?? '',
        textScaleFactor: 1.2, 
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, color: GeneralColors.mediumGray),
      ),
    );
  }
}