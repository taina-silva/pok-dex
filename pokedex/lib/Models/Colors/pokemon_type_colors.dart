import 'package:pokedex/Models/Colors/hexcolor.dart';

enum PokemonTypes {
  rock,
  ghost,
  steel,
  water,
  grass,
  psychic,
  ice,
  dark,
  fairy,
  normal,
  fighting,
  flying,
  poison,
  ground,
  bug,
  fire,
  eletric,
  dragon,
}

extension PokemonTypeColor on PokemonTypes {
  HexColor get color {
    switch (this) {
      case PokemonTypes.rock: 
        return HexColor('#B69E31');
      case PokemonTypes.ghost: 
        return HexColor('#70559B');
      case PokemonTypes.steel: 
        return HexColor('#B7B9D0');
      case PokemonTypes.water: 
        return HexColor('#6493EB');
      case PokemonTypes.grass: 
        return HexColor('#74CB48');
      case PokemonTypes.psychic: 
        return HexColor('#FB5584');
      case PokemonTypes.ice: 
        return HexColor('#9AD6DF');
      case PokemonTypes.dark: 
        return HexColor('#75574C');
      case PokemonTypes.fairy: 
        return HexColor('#E69EAC');
      case PokemonTypes.normal: 
        return HexColor('#AAA67F');
      case PokemonTypes.fighting: 
        return HexColor('#C12239');
      case PokemonTypes.flying: 
        return HexColor('#A891EC');
      case PokemonTypes.poison: 
        return HexColor('#A43E9E');
      case PokemonTypes.ground: 
        return HexColor('#DEC16B');
      case PokemonTypes.bug: 
        return HexColor('#A7B723');
      case PokemonTypes.fire: 
        return HexColor('#F57D31');
      case PokemonTypes.eletric: 
        return HexColor('#F9CF30');
      case PokemonTypes.dragon: 
        return HexColor('#7037FF');
      default:
        return HexColor('#B69E31');
    }
  }
}