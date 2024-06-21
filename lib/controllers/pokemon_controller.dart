import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/services/pokemon_service.dart';

class PokemonController with ChangeNotifier {
  final PokemonService _pokemonService = PokemonService();
  List<Pokemon> _pokemonList = [];
  Map<String, dynamic>? _selectedPokemon;
  bool _isLoading = false;
  int _offset = 0;
  final int _limit = 20; // Number of items to load per request

  List<Pokemon> get pokemonList => _pokemonList;
  Map<String, dynamic>? get selectedPokemon => _selectedPokemon;
  bool get isLoading => _isLoading;

  Future<void> loadInitialPokemonList() async {
    _isLoading = true;
    notifyListeners();
    _pokemonList = await _pokemonService.fetchPokemonList(0, _limit);
    _offset = _limit;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadMorePokemon() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();
    List<Pokemon> morePokemon =
        await _pokemonService.fetchPokemonList(_offset, _limit);
    _pokemonList.addAll(morePokemon);
    _offset += _limit;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadPokemonDetail(String url) async {
    _isLoading = true;
    notifyListeners();
    _selectedPokemon = await _pokemonService.fetchPokemonDetail(url);
    _isLoading = false;
    notifyListeners();
  }
}
