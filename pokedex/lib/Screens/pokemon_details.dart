import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/Components/Box/pokemon_power_box.dart';

class PokemonDetailsScreen extends StatefulWidget {
  PokemonDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PokemonDetailsScreen> createState() => _PokemonStateDetailsScreen();
}

class _PokemonStateDetailsScreen extends State<PokemonDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const pokemonTitleStyle = TextStyle(color: Color.fromARGB(255, 96, 92, 92), fontWeight: FontWeight.bold);     

    Widget getPokemonFeatures(String feature, String featureType, {IconData? icon}) {
      return SizedBox(
        width: size.width * 0.2,
        child: Column(
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                if(icon != null) Icon(icon, color: const Color.fromARGB(255, 121, 117, 117)),
                if(icon != null) const SizedBox(width: 5),
                Text(feature, textAlign: TextAlign.center, softWrap: true, style: const TextStyle(color: Color.fromARGB(255, 121, 117, 117)))
              ],
            ),
            const SizedBox(height: 10),
            Text(featureType, style: const TextStyle(color: Colors.grey))
          ],
        ),
      );
    }
    List<Widget> getPowersWigets() {
      const powers = ['Grass', 'Poison'];
      const powersColors = [Colors.green, Colors.purple];
      return powers.map((p) => 
        PokemonPowerBox(color: powersColors[powers.indexOf(p)], text: p)
      ).toList();
    }

    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(top : MediaQuery.of(context).viewPadding.top),
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
                  const Text('Bulbasaur', textScaleFactor: 2, style: pokemonTitleStyle),
                ],
              ),
              const Text('#001', textScaleFactor: 2, style: pokemonTitleStyle),
            ],
          ),
        ),           
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size.width,
            height: size.height * 0.6,
            padding: EdgeInsets.all(size.width * 0.01),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.only(top : size.height * 0.125),
                child: Column(
                  children: [
                    Wrap(
                      children: getPowersWigets()
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                      child: const Text(
                        'About', 
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        getPokemonFeatures('6,9 Kg', 'Weight', icon: Icons.monitor_weight_outlined),
                        getPokemonFeatures('0,7 m', 'Height', icon: Icons.straighten),
                        getPokemonFeatures('Chlorophyll Overgrow', 'Moves'),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.width * 0.05, horizontal: size.width * 0.05),
                      child: const Text(
                        'There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.', 
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Color.fromARGB(255, 96, 92, 92)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 0,
          child: SvgPicture.asset('assets/images/icons/pokeball.svg', 
            width: size.width * 0.7,
            color: Colors.black.withOpacity(0.05),
          )       
        ), 
        Positioned(
          top: 160,
          left: 75,
          child: Container(
            width: size.width * 0.65,
            height: size.width * 0.65,
            foregroundDecoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pokemons/bulbasaur.png'),
                fit: BoxFit.fill
              ),
            ),
          )
        ),     
      ],
    );
  }
}