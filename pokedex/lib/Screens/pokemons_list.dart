import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/Components/Box/pokemon_card_preview.dart';
import 'package:pokedex/Repositories/pokemonapi_repository.dart';
import 'package:pokedex/Models/Colors/general_colors.dart';
import 'package:pokedex/Models/pokemon.dart';
import 'package:pokedex/State/pokemons_list_store.dart';

class PokemonsListScreen extends StatefulWidget {
  PokemonsListScreen({Key? key}) : super(key: key);

  @override
  State<PokemonsListScreen> createState() => _PokemonsListScreen();
}

class _PokemonsListScreen extends State<PokemonsListScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> getPokemonsCardsWigets(List<Pokemon> pokemons) {
      return pokemons.map((p) => 
        PokemonCardPreview(
          pokemon: p,
        )
      ).toList();
    }

    return Padding(
        padding: EdgeInsets.only(top : MediaQuery.of(context).viewPadding.top + 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top : 8.0, bottom : 32.0, left: 32.0),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/icons/pokeball.svg', width: size.width * 0.125),
                    const SizedBox(width: 10),
                    const Text('Pokédex', textScaleFactor: 3, style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Wrap(
                children: getPokemonsCardsWigets(singletonPokemonListStore.pokemons),
              )       
            ],
          ),
        ),
    );
  }
}