// lib/views/pokemon_detail_view.dart
import 'package:flutter/material.dart';
import 'package:pokemon_app/controllers/pokemon_controller.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:provider/provider.dart';

class PokemonDetailView extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.redAccent, Colors.orangeAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '#${pokemon.id.toString().padLeft(3, '0')}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.network(
                    pokemon.imageUrl,
                    height: 150,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Base Stats',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  StatsBar(label: 'HP', value: pokemon.hp),
                  StatsBar(label: 'Attack', value: pokemon.attack),
                  StatsBar(label: 'Defense', value: pokemon.defense),
                  StatsBar(label: 'Sp. Atk', value: pokemon.spAtk),
                  StatsBar(label: 'Sp. Def', value: pokemon.spDef),
                  StatsBar(label: 'Speed', value: pokemon.speed),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatsBar extends StatelessWidget {
  final String label;
  final int value;

  StatsBar({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 75,
            child: Text(
              label,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: value / 100,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
              minHeight: 8,
            ),
          ),
          SizedBox(width: 8),
          Text(
            value.toString(),
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
