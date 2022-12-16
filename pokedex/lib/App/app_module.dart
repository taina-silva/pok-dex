import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/Repositories/pokemonapi_repository.dart';
import 'package:pokedex/Screens/pokemon_details.dart';
import 'package:pokedex/Screens/pokemons_list.dart';
import 'package:pokedex/Screens/splash.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => PokemonApiRepository())
  ];

   @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const SplashScreen()),
    ChildRoute('/pokemons_list', child: (context, args) => PokemonsListScreen()),
    ChildRoute('/detailed_pokemon', child: (context, args) => PokemonDetailsScreen(), transition: TransitionType.fadeIn),
    RedirectRoute('/redirect', to: '/'),
  ];
}