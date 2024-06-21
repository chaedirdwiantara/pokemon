import 'package:flutter/material.dart';
import 'package:pokemon_app/controllers/pokemon_controller.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:provider/provider.dart';

class PokemonDetailView extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final pokemonController = Provider.of<PokemonController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: pokemonController.selectedPokemon == null
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(pokemonController.selectedPokemon!['sprites']
                      ['front_default']),
                  Text(
                    pokemon.name,
                    style: const TextStyle(fontSize: 24),
                  ),
                  // Add more details here if needed
                ],
              ),
            ),
    );
  }
}
