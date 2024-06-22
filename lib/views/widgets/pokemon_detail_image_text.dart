import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/utils/string_utils.dart';
import 'package:pokemon_app/views/widgets/pokemon_type_chip.dart';

class PokemonDetailImageText extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailImageText({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 90,
      left: 16,
      right: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            capitalizeFirstLetter(pokemon.name),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '#${pokemon.id.toString().padLeft(3, '0')}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 5,
            children: pokemon.types
                .map((type) => PokemonTypeChip(type: type))
                .toList(),
          ),
          const SizedBox(height: 10), // Add some space before the image
          Center(
            child: Transform.translate(
              offset: const Offset(0, -30), // Move the image up by 30px
              child: Image.network(
                pokemon.imageUrlHD,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
