import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';

class AboutTab extends StatelessWidget {
  final Pokemon pokemon;

  const AboutTab({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoRow(
              label: 'Species', value: capitalizeFirstLetter(pokemon.species)),
          InfoRow(label: 'Height', value: '${pokemon.height} m'),
          InfoRow(label: 'Weight', value: '${pokemon.weight} kg'),
          InfoRow(
            label: 'Abilities',
            value: pokemon.abilities
                .map((ability) => capitalizeFirstLetter(ability))
                .join(', '),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({required this.label, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}
