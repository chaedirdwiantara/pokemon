// lib/models/evolution.dart
class Evolution {
  final String name;
  final String imageUrl;

  Evolution({required this.name, required this.imageUrl});

  factory Evolution.fromJson(Map<String, dynamic> json, String imageUrl) {
    return Evolution(
      name: json['species']['name'],
      imageUrl: imageUrl,
    );
  }
}

class EvolutionChain {
  final List<Evolution> evolutions;

  EvolutionChain({required this.evolutions});

  factory EvolutionChain.fromJson(Map<String, dynamic> json) {
    List<Evolution> evolutions = [];
    var current = json['chain'];
    while (current != null) {
      evolutions.add(Evolution.fromJson(current, ''));
      if (current['evolves_to'].isNotEmpty) {
        current = current['evolves_to'][0];
      } else {
        current = null;
      }
    }
    return EvolutionChain(evolutions: evolutions);
  }
}
