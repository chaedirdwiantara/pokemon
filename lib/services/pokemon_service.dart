import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/models/pokemon.dart';

class PokemonService {
  static const String apiUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<Pokemon>> fetchPokemonList() async {
    final response = await http.get(Uri.parse('$apiUrl?limit=100'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['results'];
      return data.map((pokemon) => Pokemon.fromJson(pokemon)).toList();
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }

  Future<Pokemon> fetchPokemonDetail(String name) async {
    final response = await http.get(Uri.parse('$apiUrl/$name'));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Pokémon details');
    }
  }
}
