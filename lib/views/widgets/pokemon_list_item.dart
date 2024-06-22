import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/utils/string_utils.dart';
import 'package:pokemon_app/utils/gradient_colors.dart';
import 'package:pokemon_app/views/widgets/pokemon_type_chip.dart';

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onTap;

  const PokemonListItem({required this.pokemon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = getGradientColors(pokemon.types[0]);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 12.0, bottom: 5.0, right: 5.0, left: 12.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    capitalizeFirstLetter(pokemon.name),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pokemon.types
                        .take(2)
                        .map((type) => Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: PokemonTypeChip(type: type),
                            ))
                        .toList(),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.network(
                  pokemon.imageUrlHD,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
