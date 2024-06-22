import 'package:flutter/material.dart';
import 'package:pokemon_app/utils/string_utils.dart';

class PokemonTypeChip extends StatelessWidget {
  final String type;

  const PokemonTypeChip({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Text(
        capitalizeFirstLetter(type),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
