import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/Models/Colors/general_colors.dart';
import 'package:pokedex/Models/pokemon.dart';
import 'package:pokedex/Screens/pokemon_details.dart';

import '../../State/pokemon_store.dart';

class PokemonCardPreview extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCardPreview({
    Key? key, 
    required this.pokemon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (() => {
        singletonPokemonStore.updatePokemon(pokemon),
        Navigator.push(context, 
          MaterialPageRoute(builder: (context) => const PokemonDetailsScreen()))}
      ),
      child: Container(
        width: size.width * 0.4,
        margin: EdgeInsets.only(
          right: size.width * 0.02,
          left: size.width * 0.02,
          bottom: size.width * 0.03,
        ),
        decoration: BoxDecoration(
          color: GeneralColors.background,
          border: Border.all(color: pokemon.color, width: 1.5),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: GeneralColors.shadowCard,
              blurRadius: 8.0,
              spreadRadius: 1.0,
              offset: Offset(
                -7.0, 
                8.0, 
              )
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                    padding: const EdgeInsets.only(right: 8.0,top: 8.0),
                    child: Text(pokemon.getCode()),
                  )
              ],),
              SvgPicture.network(
                pokemon.image,
                height: size.width * 0.3,
              ),
              Container(
                color: pokemon.color,  
                width: double.infinity,  
                height: 35,  
                child: Center(child: Text(pokemon.name, style: TextStyle(color: GeneralColors.white, fontWeight: FontWeight.bold))),        
              ),
            ],
          ),
        ),
      ),
    );
  }
}