import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/utils/string_utils.dart';
import 'package:pokemon_app/views/widgets/pokemon_type_chip.dart';

class PokemonDetailImageTextLandscape extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailImageTextLandscape({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          capitalizeFirstLetter(pokemon.name),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '#${pokemon.id.toString().padLeft(3, '0')}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 5,
          children:
              pokemon.types.map((type) => PokemonTypeChip(type: type)).toList(),
        ),
        const SizedBox(height: 10),
        Center(
          child: Transform.translate(
            offset: const Offset(0, -20),
            child: Image.network(
              pokemon.imageUrlHD,
              height: 180,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
