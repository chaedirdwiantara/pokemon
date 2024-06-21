import 'package:flutter/material.dart';
import 'package:pokemon_app/controllers/pokemon_controller.dart';
import 'package:pokemon_app/views/pokemon_detail_view.dart';
import 'package:provider/provider.dart';

class PokemonListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonController = Provider.of<PokemonController>(context);

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
            : ListView.builder(
                itemCount: pokemonController.pokemonList.length + 1,
                itemBuilder: (context, index) {
                  if (index == pokemonController.pokemonList.length) {
                    return pokemonController.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox();
                  }
                  final pokemon = pokemonController.pokemonList[index];
                  return ListTile(
                    leading: pokemon.imageUrl.isNotEmpty
                        ? Image.network(pokemon.imageUrl)
                        : Container(
                            width: 50,
                            height: 50,
                            color: Colors.grey,
                            child: const Icon(Icons.image_not_supported),
                          ),
                    title: Text(pokemon.name),
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
    );
  }
}
