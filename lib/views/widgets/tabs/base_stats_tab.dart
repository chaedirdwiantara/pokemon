// lib/views/widgets/tabs/base_stats_tab.dart
import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';

class BaseStatsTab extends StatelessWidget {
  final Pokemon pokemon;

  const BaseStatsTab({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatsBar(label: 'HP', value: pokemon.hp),
        const SizedBox(height: 15),
        StatsBar(label: 'Attack', value: pokemon.attack),
        const SizedBox(height: 15),
        StatsBar(label: 'Defense', value: pokemon.defense),
        const SizedBox(height: 15),
        StatsBar(label: 'Sp. Atk', value: pokemon.spAtk),
        const SizedBox(height: 15),
        StatsBar(label: 'Sp. Def', value: pokemon.spDef),
        const SizedBox(height: 15),
        StatsBar(label: 'Speed', value: pokemon.speed),
      ],
    );
  }
}

class StatsBar extends StatelessWidget {
  final String label;
  final int value;

  const StatsBar({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final color = value >= 50 ? Colors.green : Colors.red;

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10.0), // Adjust the spacing here
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 4), // Reduce the spacing here
          SizedBox(
            width: 25, // Fixed width for the value text
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value.toString(),
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          const SizedBox(width: 15), // Reduce the spacing here
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Add border radius
              child: LinearProgressIndicator(
                value: value / 100,
                backgroundColor: Colors.grey[300],
                color: color,
                minHeight: 6, // Reduce the thickness
              ),
            ),
          ),
        ],
      ),
    );
  }
}
