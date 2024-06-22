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

    Future<void> _loadAndNavigate(Pokemon pokemon) async {
      await pokemonController.loadPokemonDetail(pokemon.url);
      if (pokemonController.selectedPokemon != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PokemonDetailView(pokemon: pokemonController.selectedPokemon!),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon List'),
      ),
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  !pokemonController.isLoading) {
                // Load more data when the end of the list is reached
                pokemonController.loadMorePokemon();
              }
              return false;
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount, // Number of columns
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 3 / 2, // Adjust the aspect ratio as needed
                ),
                itemCount: pokemonController.pokemonList.length,
                itemBuilder: (context, index) {
                  final pokemon = pokemonController.pokemonList[index];
                  return PokemonListItem(
                    pokemon: pokemon,
                    onTap: () => _loadAndNavigate(pokemon),
                  );
                },
              ),
            ),
          ),
          if (pokemonController.isLoading)
            const Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
