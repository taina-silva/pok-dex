import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/Components/Box/pokemon_card_preview.dart';
import 'package:pokedex/Components/Box/pokemon_power_box.dart';

class PokemonsListScreen extends StatefulWidget {
  PokemonsListScreen({Key? key}) : super(key: key);

  @override
  State<PokemonsListScreen> createState() => _PokemonStateDetailsScreen();
}

class _PokemonStateDetailsScreen extends State<PokemonsListScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> getPokemonsCardsWigets() {
      const pokemonsImagesPaths = ['assets/images/pokemons/bulbasaur.png', 'assets/images/pokemons/charmander.png'];
      const colors = [Colors.green, Colors.orange];
      const pokemonsNames = ['Bulbasaur', 'Charmander'];
      const pokemonsIds = ['#001', '#002'];
      return pokemonsImagesPaths.map((p) => 
        PokemonCardPreview(
          color: colors[pokemonsImagesPaths.indexOf(p)],
          pokemonImagePath: p,
          pokemonName: pokemonsNames[pokemonsImagesPaths.indexOf(p)],
          pokemonId: pokemonsIds[pokemonsImagesPaths.indexOf(p)]
        )
      ).toList();
    }

    return Padding(
      padding: EdgeInsets.only(top : MediaQuery.of(context).viewPadding.top),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top : 32.0, bottom : 32.0, left: 32.0),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/icons/pokeball.svg', width: size.width * 0.125),
                const SizedBox(width: 10),
                const Text('Pokédex', textScaleFactor: 3, style: const TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          Wrap(
            children: getPokemonsCardsWigets(),
          ) 
        ],
      ),
    );
  }
}