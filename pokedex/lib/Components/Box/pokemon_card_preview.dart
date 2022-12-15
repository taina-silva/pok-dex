import 'package:flutter/material.dart';

class PokemonCardPreview extends StatelessWidget {
  final Color color;
  final String pokemonImagePath;
  final String pokemonName;
  final String pokemonId;
  const PokemonCardPreview({
    Key? key, 
    required this.color,
    required this.pokemonImagePath,
    required this.pokemonName,
    required this.pokemonId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.4,
      margin: EdgeInsets.only(
        right: size.width * 0.02,
        left: size.width * 0.02,
        bottom: size.width * 0.03,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 1.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0,top: 8.0),
                child: Text(pokemonId),)
            ],),
            Image.asset(pokemonImagePath),
            Container(
              color: color,  
              width: double.infinity,  
              height: 35,  
              child: Center(child: Text(pokemonName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),        
            ),
          ],
        ),
      ),
    );
  }
}