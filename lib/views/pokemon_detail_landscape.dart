import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/views/widgets/pokemon_detail_bottom_landscape.dart';
import 'package:pokemon_app/views/widgets/pokemon_detail_image_text_landscape.dart';
import 'package:pokemon_app/views/widgets/pokemon_detail_top.dart';

class PokemonDetailLandscape extends StatelessWidget {
  final Pokemon pokemon;
  final bool isLiked;
  final VoidCallback onToggleLike;

  const PokemonDetailLandscape({
    required this.pokemon,
    required this.isLiked,
    required this.onToggleLike,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        PokemonDetailTop(pokemon: pokemon),
                        Positioned(
                          top: 30,
                          left: 16,
                          right: 16,
                          child:
                              PokemonDetailImageTextLandscape(pokemon: pokemon),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: PokemonDetailBottomLandscape(pokemon: pokemon),
            ),
          ],
        ),
        Positioned(
          top: 30,
          left: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Positioned(
          top: 30,
          left: 310,
          child: IconButton(
            icon: Icon(
              Icons.favorite,
              color: isLiked ? Colors.pink : Colors.white,
              size: 26.0,
            ),
            onPressed: onToggleLike,
          ),
        ),
      ],
    );
  }
}
