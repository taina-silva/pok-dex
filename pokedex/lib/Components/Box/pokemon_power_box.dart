import 'package:flutter/material.dart';

class PokemonPowerBox extends StatelessWidget {
  final Color color;
  final String text;
  const PokemonPowerBox({
    Key? key, 
    required this.color,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.only(
        right: size.width * 0.02,
        left: size.width * 0.02,
        bottom: size.width * 0.03,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: color, spreadRadius: 3),
        ],
      ),
      child: Text(
        text,
        textScaleFactor: 1.2, 
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}