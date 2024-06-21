import 'package:flutter/material.dart';
import 'package:pokemon_app/controllers/pokemon_controller.dart';
import 'package:pokemon_app/views/pokemon_list_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonController()..loadInitialPokemonList(),
      child: MaterialApp(
        title: 'Pokémon App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PokemonListView(),
      ),
    );
  }
}
