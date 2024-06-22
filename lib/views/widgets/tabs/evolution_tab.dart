import 'package:flutter/material.dart';
import 'package:pokemon_app/models/evolution.dart';

class EvolutionTab extends StatelessWidget {
  final EvolutionChain evolutionChain;

  const EvolutionTab({required this.evolutionChain, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final evolutions = evolutionChain.evolutions;
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: evolutions.length,
      itemBuilder: (context, index) {
        final evolution = evolutions[index];
        return ListTile(
          leading: evolution.imageUrl.isNotEmpty
              ? Image.network(evolution.imageUrl)
              : const Icon(Icons.image_not_supported),
          title: Text(capitalizeFirstLetter(evolution.name)),
        );
      },
    );
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
