import 'package:flutter/material.dart';

enum PokemonsNames {
  bulbasaur,
  ivysaur,
  venusaur,
  charmander,
  charmeleon,
  charizard,
  squirtle,
  wartortle,
  blastoise,
  caterpie,
  metapod,
  butterfree,
  weedle,
  kakuna,
  beedrill,
  pidgey,
  pidgeotto,
  pidgeot,
  rattata,
  raticate
}

extension PokemonColor on PokemonsNames {
  Color get color {
    switch (this) {
      case PokemonsNames.bulbasaur:
        return Colors.green;
      case PokemonsNames.ivysaur:
        return Colors.green;
      case PokemonsNames.venusaur:
        return Colors.green;
      case PokemonsNames.charmander:
        return Colors.red;
      case PokemonsNames.charmeleon:
        return Colors.red;
      case PokemonsNames.charizard:
        return Colors.red;
      case PokemonsNames.squirtle:
        return Colors.blue;
      case PokemonsNames.wartortle:
        return Colors.blue;
      case PokemonsNames.blastoise:
        return Colors.blue;
      case PokemonsNames.caterpie:
        return Colors.green;
      case PokemonsNames.metapod:
        return Colors.green;
      case PokemonsNames.butterfree:
        return Colors.white;
      case PokemonsNames.weedle:
        return Colors.brown;
      case PokemonsNames.kakuna:
        return Colors.yellow;
      case PokemonsNames.beedrill:
        return Colors.yellow;
      case PokemonsNames.pidgey:
        return Colors.brown;
      case PokemonsNames.pidgeotto:
        return Colors.brown;
      case PokemonsNames.pidgeot:
        return Colors.brown;
      case PokemonsNames.rattata:
        return Colors.purple;
      case PokemonsNames.raticate:
        return Colors.brown;
      default: 
        return Colors.black;
    }
  }
}