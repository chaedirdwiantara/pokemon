// lib/views/widgets/tabs/moves_tab.dart
import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';

class MovesTab extends StatelessWidget {
  final Pokemon pokemon;

  const MovesTab({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: pokemon.moves.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            capitalizeFirstLetter(pokemon.moves[index]),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
