import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';

class PokemonDetailBottom extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailBottom({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 45, left: 16, right: 16), // Increase top padding to 25px
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Base Stats',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            StatsBar(label: 'HP', value: pokemon.hp),
            StatsBar(label: 'Attack', value: pokemon.attack),
            StatsBar(label: 'Defense', value: pokemon.defense),
            StatsBar(label: 'Sp. Atk', value: pokemon.spAtk),
            StatsBar(label: 'Sp. Def', value: pokemon.spDef),
            StatsBar(label: 'Speed', value: pokemon.speed),
          ],
        ),
      ),
    );
  }
}

class StatsBar extends StatelessWidget {
  final String label;
  final int value;

  const StatsBar({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: value / 100,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
              minHeight: 8,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value.toString(),
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
