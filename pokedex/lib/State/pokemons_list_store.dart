import 'package:mobx/mobx.dart';
import 'package:pokedex/Models/pokemon.dart';
import 'package:pokedex/Repositories/pokemonapi_repository.dart';
part 'pokemons_list_store.g.dart';

class PokemonListStore extends _PokemonListStoreBase with _$PokemonListStore {
    PokemonListStore(PokemonApiRepository pokemonApiRepository) : super(pokemonApiRepository);
}

enum StoreState { initial, loading, loaded }

abstract class _PokemonListStoreBase with Store {
  final PokemonApiRepository _pokemonApiRepository;
  _PokemonListStoreBase(this._pokemonApiRepository);

  @observable
  List<Pokemon> pokemons = [];

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future getPokemons() async {
    isLoading = true;
    try {
      errorMessage = null;
      final pokemonsList = await _pokemonApiRepository.fetchPokemons();
      pokemons = pokemonsList;
      isLoading = false;
    } catch (error) {
      errorMessage = "Não foi possível carregar pokemons da pokeapi";
    }
  }
}

PokemonListStore _singleton = PokemonListStore(PokemonApiRepository());
PokemonListStore get singletonPokemonListStore => _singleton;