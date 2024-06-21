// lib/views/widgets/pokemon_list_item.dart
import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onTap;

  const PokemonListItem({required this.pokemon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Add border radius here
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 5.0), // Add top and bottom padding to the Column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    image: DecorationImage(
                      image: pokemon.imageUrl.isNotEmpty
                          ? NetworkImage(pokemon.imageUrl)
                          : const AssetImage(
                                  'assets/images/image_not_found.png')
                              as ImageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                pokemon.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
