import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'widgets/pokemon_detail_top.dart';
import 'widgets/pokemon_detail_bottom.dart';
import 'widgets/pokemon_detail_image_text.dart';

class PokemonDetailView extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PokemonDetailTop(pokemon: pokemon),
          Align(
            alignment: Alignment.bottomCenter,
            child: PokemonDetailBottom(pokemon: pokemon),
          ),
          PokemonDetailImageText(pokemon: pokemon),
          Positioned(
            top: 40,
            left: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
