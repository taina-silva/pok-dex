import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokedex/Models/pokemon.dart';

class PokemonApiRepository {

  Future<List<Pokemon>> fetchPokemons({int? quantity}) async {
    final List<Pokemon> pokemons = [];
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=20&limit=${quantity ?? 20}'));
    
    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      for(var pokemon in res['results']) {
        int pokemonId = res['results'].indexOf(pokemon) + 1;

        final responsePokemonDetails = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonId'));        

        if (responsePokemonDetails.statusCode == 200) {
          final Map<String, dynamic> jsonRes = json.decode(responsePokemonDetails.body);
          jsonRes['description'] = '';
          final responsePokemonDescription = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$pokemonId'));
          
          if(responsePokemonDescription.statusCode == 200)
            jsonRes['description'] = json.decode(responsePokemonDescription.body)['flavor_text_entries'][0]['flavor_text'].replaceAll("\n", " ");             
          else print('Failed to load pokemon description of $pokemonId');

          Pokemon pokemon = Pokemon.fromJson(jsonRes); 
          pokemons.add(pokemon);  
                   
        } else print('Failed to load pokemon $pokemonId');
      }

      return pokemons;
    } else throw Exception('Failed to load pokemons');
  }
  
}