// lib/models/pokemon.dart
class Pokemon {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<String> types;
  final List<String> abilities;
  final String imageUrl;
  final int hp;
  final int attack;
  final int defense;
  final int spAtk;
  final int spDef;
  final int speed;
  final String url;

  Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
    required this.imageUrl,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.spAtk,
    required this.spDef,
    required this.speed,
    required this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<String> types = (json['types'] as List)
        .map((type) => type['type']['name'] as String)
        .toList();
    List<String> abilities = (json['abilities'] as List)
        .map((ability) => ability['ability']['name'] as String)
        .toList();

    return Pokemon(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      types: types,
      abilities: abilities,
      imageUrl: json['sprites']['front_default'] ?? '',
      hp: json['stats'][0]['base_stat'],
      attack: json['stats'][1]['base_stat'],
      defense: json['stats'][2]['base_stat'],
      spAtk: json['stats'][3]['base_stat'],
      spDef: json['stats'][4]['base_stat'],
      speed: json['stats'][5]['base_stat'],
      url: json['url'] ?? '',
    );
  }
}
