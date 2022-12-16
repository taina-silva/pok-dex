import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/Components/Box/pokemon_power_box.dart';
import 'package:pokedex/Models/Colors/general_colors.dart';
import 'package:pokedex/Models/Colors/pokemon_type_colors.dart';
import 'package:pokedex/State/pokemon_store.dart';
import 'package:pokedex/Utils/strings.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final pokemonTitleStyle = TextStyle(color: GeneralColors.darkGray, fontWeight: FontWeight.bold);     

    Widget getPokemonFeaturesWidgets(List<String> feature, String featureType, {IconData? icon}) {
      return SizedBox(
        width: size.width * 0.2,
        child: Column(
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                if(icon != null) Icon(icon, color: const Color.fromARGB(255, 121, 117, 117)),
                if(icon != null) const SizedBox(width: 5),
                Column(
                  children: feature.map((e) => Text(
                    capitalize(e),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: const TextStyle(color: Color.fromARGB(255, 121, 117, 117)
                    ))).toList(),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(featureType, style: TextStyle(color: GeneralColors.mediumGray))
          ],
        ),
      );
    }

    List<Widget> getPowersWigets() {
      return singletonPokemonStore.pokemon!.types.map((type) => 
        PokemonPowerBox(color: PokemonTypes.values.byName(type).color, text: capitalize(type))
      ).toList();
    }

    return Observer(
      builder: (context) {
        return singletonPokemonStore.pokemon == null ?
          const Text('ERRO') :
          Scaffold(
            body: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height,
                padding: EdgeInsets.only(top : MediaQuery.of(context).viewPadding.top + 10),
                color: singletonPokemonStore.pokemon!.color,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back), color: GeneralColors.mediumGray),
                        Text(singletonPokemonStore.pokemon!.name, textScaleFactor: 2, style: pokemonTitleStyle),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(singletonPokemonStore.pokemon!.getCode(), textScaleFactor: 2, style: pokemonTitleStyle),
                    ),
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
                    color: GeneralColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.only(top : size.height * 0.125),
                      child: Column(
                        children: [
                          Wrap(children: getPowersWigets()),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                            child: Text(
                              'About', 
                              textScaleFactor: 1.5,
                              style: TextStyle(color: singletonPokemonStore.pokemon!.color, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              getPokemonFeaturesWidgets(['${singletonPokemonStore.pokemon!.weight.toString()} lb'], 'Weight', icon: Icons.monitor_weight_outlined),
                              getPokemonFeaturesWidgets(['${singletonPokemonStore.pokemon!.height.toString()} feet'], 'Height', icon: Icons.straighten),
                              getPokemonFeaturesWidgets(singletonPokemonStore.pokemon!.moves, 'Moves'),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: size.width * 0.05, horizontal: size.width * 0.05),
                            child: Text(
                              singletonPokemonStore.pokemon!.description, 
                              textAlign: TextAlign.justify,
                              textScaleFactor: 1.2,
                              style: TextStyle(color: GeneralColors.mediumGray),
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
                  color: GeneralColors.darkGray.withOpacity(0.05),
                )       
              ), 
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back), color: GeneralColors.mediumGray),
                      SvgPicture.network(
                          singletonPokemonStore.pokemon!.image,
                          height: size.width * 0.60,
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward), color: GeneralColors.mediumGray),
                    ],
                  ),
                ),
              ),     
            ],
          ),
        );
      }
    );
  }
}