import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/models/evolution.dart';
import 'package:pokemon_app/models/pokemon.dart';

class PokemonService {
  static const String apiUrl = 'https://pokeapi.co/api/v2/pokemon';
  static const String speciesUrl = 'https://pokeapi.co/api/v2/pokemon-species';

  Future<List<Pokemon>> fetchPokemonList(int offset, int limit) async {
    final response =
        await http.get(Uri.parse('$apiUrl?offset=$offset&limit=$limit'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['results'];
      List<Pokemon> pokemonList = [];
      for (var item in data) {
        final detailResponse = await http.get(Uri.parse(item['url']));
        if (detailResponse.statusCode == 200) {
          try {
            var pokemonData = jsonDecode(detailResponse.body);
            pokemonData['url'] =
                item['url']; // Assign the url from the list response
            pokemonList.add(Pokemon.fromJson(pokemonData));
          } catch (e) {
            print('Error parsing Pokémon detail for ${item['url']}: $e');
            print('Response body: ${detailResponse.body}');
            throw Exception('Failed to parse Pokémon details');
          }
        } else {
          throw Exception('Failed to load Pokémon details');
        }
      }
      return pokemonList;
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }

  Future<Pokemon> fetchPokemonDetail(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      try {
        var decodedResponse = jsonDecode(response.body);
        return Pokemon.fromJson(decodedResponse);
      } catch (e) {
        print('Error parsing Pokémon detail: $e');
        print('Response body: ${response.body}');
        throw Exception('Failed to parse Pokémon details');
      }
    } else {
      throw Exception('Failed to load Pokémon details');
    }
  }

  Future<EvolutionChain> fetchEvolutionChain(int speciesId) async {
    final speciesResponse = await http.get(Uri.parse('$speciesUrl/$speciesId'));
    if (speciesResponse.statusCode == 200) {
      final speciesData = jsonDecode(speciesResponse.body);
      final evolutionChainUrl = speciesData['evolution_chain']['url'];
      final evolutionResponse = await http.get(Uri.parse(evolutionChainUrl));
      if (evolutionResponse.statusCode == 200) {
        final evolutionData = jsonDecode(evolutionResponse.body);
        EvolutionChain evolutionChain = EvolutionChain.fromJson(evolutionData);

        // Fetch image URLs for each evolution stage
        List<Evolution> updatedEvolutions = [];
        for (var evolution in evolutionChain.evolutions) {
          final pokemonResponse =
              await http.get(Uri.parse('$apiUrl/${evolution.name}'));
          if (pokemonResponse.statusCode == 200) {
            final pokemonData = jsonDecode(pokemonResponse.body);
            updatedEvolutions.add(Evolution(
              name: evolution.name,
              imageUrl: pokemonData['sprites']['front_default'] ?? '',
            ));
          } else {
            updatedEvolutions.add(evolution); // Keep existing if fetch fails
          }
        }

        return EvolutionChain(evolutions: updatedEvolutions);
      } else {
        throw Exception('Failed to load Evolution Chain');
      }
    } else {
      throw Exception('Failed to load Pokémon Species');
    }
  }
}
