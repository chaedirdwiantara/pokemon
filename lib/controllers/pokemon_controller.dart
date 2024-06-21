import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/services/pokemon_service.dart';

class PokemonController with ChangeNotifier {
  final PokemonService _pokemonService = PokemonService();
  List<Pokemon> _pokemonList = [];
  Pokemon? _selectedPokemon;
  bool _isLoading = false;

  List<Pokemon> get pokemonList => _pokemonList;
  Pokemon? get selectedPokemon => _selectedPokemon;
  bool get isLoading => _isLoading;

  Future<void> loadPokemonList() async {
    _isLoading = true;
    notifyListeners();
    _pokemonList = await _pokemonService.fetchPokemonList();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadPokemonDetail(String name) async {
    _isLoading = true;
    notifyListeners();
    _selectedPokemon = await _pokemonService.fetchPokemonDetail(name);
    _isLoading = false;
    notifyListeners();
  }
}
