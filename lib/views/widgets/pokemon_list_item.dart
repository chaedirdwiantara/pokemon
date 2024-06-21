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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: pokemon.imageUrl.isNotEmpty
                        ? NetworkImage(pokemon.imageUrl)
                        : const AssetImage('assets/images/image_not_found.png')
                            as ImageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              pokemon.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
