import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/Screens/pokemons_list.dart';
import 'package:pokedex/State/pokemons_list_store.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    getPokemons();
    super.initState();
  }

  Future<void> getPokemons() async {
    await singletonPokemonListStore.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Observer(
        builder: (context) {
          if (singletonPokemonListStore.isLoading) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Image.asset('assets/images/icons/pokemon_logo.png', width: size.width * 0.7),
              ),
            );
          } 
          return const PokemonsListScreen();
        }
      )
    );
  }
}
