// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonStore on _PokemonStoreBase, Store {
  late final _$pokemonAtom =
      Atom(name: '_PokemonStoreBase.pokemon', context: context);

  @override
  Pokemon? get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(Pokemon? value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  late final _$_PokemonStoreBaseActionController =
      ActionController(name: '_PokemonStoreBase', context: context);

  @override
  dynamic updatePokemon(Pokemon p) {
    final _$actionInfo = _$_PokemonStoreBaseActionController.startAction(
        name: '_PokemonStoreBase.updatePokemon');
    try {
      return super.updatePokemon(p);
    } finally {
      _$_PokemonStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemon: ${pokemon}
    ''';
  }
}
