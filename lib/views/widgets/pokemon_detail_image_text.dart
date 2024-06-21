import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';

class PokemonDetailImageText extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailImageText({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 90, // Position the text below the back arrow
      left: 16, // Align text to the left
      right: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          Text(
            pokemon.name,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.centerRight, // Align the ID text to the end
            child: Text(
              '#${pokemon.id.toString().padLeft(3, '0')}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(height: 40), // Space between text and image
          Center(
            child: Image.network(
              pokemon.imageUrl,
              height: 250, // Reduce the size of the image by 50%
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
