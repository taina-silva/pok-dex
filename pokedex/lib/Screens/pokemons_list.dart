import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/State/pokemons_list_store.dart';
import 'package:pokedex/Utils/pokemons_widgets.dart';
import '../Components/Text/warning_text.dart';

class PokemonsListScreen extends StatefulWidget {
  const PokemonsListScreen({Key? key}) : super(key: key);

  @override
  State<PokemonsListScreen> createState() => _PokemonsListScreen();
}

class _PokemonsListScreen extends State<PokemonsListScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
              singletonPokemonListStore.warningMessage != null ? 
                Wrap(children: PokemonsCustomWidgets(context).getPokemonsPreviewCardsWigets()) :
                const WarningText()    
            ],
          ),
        ),
    );
  }
}