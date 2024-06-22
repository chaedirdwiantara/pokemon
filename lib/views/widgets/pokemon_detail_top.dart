import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/utils/gradient_colors.dart';

class PokemonDetailTop extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailTop({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = getGradientColors(pokemon.types[0]);

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
