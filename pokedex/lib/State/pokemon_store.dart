import 'package:mobx/mobx.dart';
import 'package:pokedex/Models/pokemon.dart';
import 'package:pokedex/State/pokemons_list_store.dart';
part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  @observable
  Pokemon? pokemon;

  @action
  updatePokemon(Pokemon p) {
    pokemon = p;
  } 

  @action
  updateToPreviousPokemon() {
    pokemon = getPreviousOrNextPokemon(true);
  }

  @action
  updateToNextPokemon() {
    pokemon = getPreviousOrNextPokemon(false);
  }  

  Pokemon? getPreviousOrNextPokemon(bool previous) {
    List<Pokemon> pokemonsList = singletonPokemonListStore.pokemons;
    if(pokemon != null) {
      final indexOfActualPokemon = pokemonsList.indexOf(pokemon!);
      final bool condition = previous ? (indexOfActualPokemon > 0) : indexOfActualPokemon != (pokemonsList.length - 1);
      final int newIndex = previous ? (indexOfActualPokemon - 1) : (indexOfActualPokemon + 1); 
      return condition ? pokemonsList[newIndex] : null;
    }
    return null;
  }  
}

PokemonStore _singleton = PokemonStore();
PokemonStore get singletonPokemonStore => _singleton;