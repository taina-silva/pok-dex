import 'package:mobx/mobx.dart';
import 'package:pokedex/Models/pokemon.dart';
part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  @observable
  Pokemon? pokemon;

  @action
  updatePokemon(Pokemon p) {
    pokemon = p;
  }
}

PokemonStore _singleton = PokemonStore();
PokemonStore get singletonPokemonStore => _singleton;