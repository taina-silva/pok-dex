// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonListStore on _PokemonListStoreBase, Store {
  late final _$pokemonsAtom =
      Atom(name: '_PokemonListStoreBase.pokemons', context: context);

  @override
  List<Pokemon> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(List<Pokemon> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PokemonListStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_PokemonListStoreBase.errorMessage', context: context);

  @override
  String? get warningMessage {
    _$errorMessageAtom.reportRead();
    return super.warningMessage;
  }

  @override
  set warningMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.warningMessage, () {
      super.warningMessage = value;
    });
  }

  late final _$getPokemonsAsyncAction =
      AsyncAction('_PokemonListStoreBase.getPokemons', context: context);

  @override
  Future<dynamic> getPokemons() {
    return _$getPokemonsAsyncAction.run(() => super.getPokemons());
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
isLoading: ${isLoading},
errorMessage: ${warningMessage}
    ''';
  }
}
