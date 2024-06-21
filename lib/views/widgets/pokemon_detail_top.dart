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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Text(
            pokemon.name,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            '#${pokemon.id.toString().padLeft(3, '0')}',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
