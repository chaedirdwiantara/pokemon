// lib/services/pokemon_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/models/pokemon.dart';

class PokemonService {
  static const String apiUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<Pokemon>> fetchPokemonList(int offset, int limit) async {
    final response =
        await http.get(Uri.parse('$apiUrl?offset=$offset&limit=$limit'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['results'];
      List<Pokemon> pokemonList = [];
      for (var item in data) {
        final detailResponse = await http.get(Uri.parse(item['url']));
        if (detailResponse.statusCode == 200) {
          var detailData = jsonDecode(detailResponse.body);
          pokemonList.add(Pokemon(
            name: item['name'] ?? 'Unknown',
            url: item['url'] ?? '',
            imageUrl: detailData['sprites'] != null
                ? detailData['sprites']['front_default'] ?? ''
                : '',
          ));
        }
      }
      return pokemonList;
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }

  Future<Map<String, dynamic>> fetchPokemonDetail(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Pokémon details');
    }
  }
}
