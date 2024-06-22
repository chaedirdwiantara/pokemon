import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';

class PokemonDetailTop extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailTop({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.redAccent, Colors.orangeAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
