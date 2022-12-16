import 'package:flutter/material.dart';
import 'package:pokedex/State/pokemon_store.dart';
import 'package:pokedex/State/pokemons_list_store.dart';
import 'package:pokedex/Utils/strings.dart';
import '../Components/Box/pokemon_card_preview.dart';
import '../Components/Box/pokemon_power_box.dart';
import '../Models/Colors/general_colors.dart';
import '../Models/Colors/pokemon_type_colors.dart';

class PokemonsCustomWidgets {
  final BuildContext context;
  PokemonsCustomWidgets(this.context);

  Widget getPokemonFeaturesWidgets(List<String> feature, String featureType, {IconData? icon}) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.2,
      child: Column(
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if(icon != null) Icon(icon, color: const Color.fromARGB(255, 121, 117, 117)),
              if(icon != null) const SizedBox(width: 5),
              Column(
                children: feature.map((e) => Text(
                  capitalize(e),
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: const TextStyle(color: Color.fromARGB(255, 121, 117, 117)
                  ))).toList(),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(featureType, style: TextStyle(color: GeneralColors.mediumGray))
        ],
      ),
    );
    }

  List<Widget> getPokemonsPreviewCardsWigets() {
    return singletonPokemonListStore.pokemons.map((p) => 
      PokemonCardPreview(pokemon: p)
    ).toList();
  }

  List<Widget> getPokemonPowersWigets() {
    return singletonPokemonStore.pokemon != null ?
      singletonPokemonStore.pokemon!.types.map((type) => 
        PokemonPowerBox(color: PokemonTypes.values.byName(type).color, text: capitalize(type))
    ).toList() : [];
  }
} 