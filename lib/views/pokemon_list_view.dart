// lib/views/pokemon_list_view.dart
import 'package:flutter/material.dart';
import 'package:pokemon_app/controllers/pokemon_controller.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/views/pokemon_detail_view.dart';
import 'package:provider/provider.dart';
import 'widgets/pokemon_list_item.dart';

class PokemonListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonController = Provider.of<PokemonController>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = (screenWidth ~/ 200)
        .clamp(2, 4); // Adjust the number of columns based on screen width

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon List'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            // Load more data when the end of the list is reached
            pokemonController.loadMorePokemon();
          }
          return false;
        },
        child: pokemonController.isLoading &&
                pokemonController.pokemonList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount, // Number of columns
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio:
                        3 / 2, // Adjust the aspect ratio as needed
                  ),
                  itemCount: pokemonController.pokemonList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == pokemonController.pokemonList.length) {
                      return pokemonController.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : const SizedBox();
                    }
                    final pokemon = pokemonController.pokemonList[index];
                    return PokemonListItem(
                      pokemon: pokemon,
                      onTap: () async {
                        await pokemonController.loadPokemonDetail(pokemon.url);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PokemonDetailView(pokemon: pokemon),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
      ),
    );
  }
}
