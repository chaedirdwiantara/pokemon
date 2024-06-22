class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final String imageUrlHD;
  final List<String> types;
  final int hp;
  final int attack;
  final int defense;
  final int spAtk;
  final int spDef;
  final int speed;
  final String species;
  final double height;
  final double weight;
  final List<String> abilities;
  final String url;
  final List<String> moves;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.imageUrlHD,
    required this.types,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.spAtk,
    required this.spDef,
    required this.speed,
    required this.species,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.url,
    required this.moves,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['front_default'] ?? '',
      imageUrlHD: json['sprites']['other']['official-artwork']['front_default'],
      types: (json['types'] as List<dynamic>?)
              ?.map((type) => type['type']['name'] as String)
              .toList() ??
          [],
      hp: json['stats'][0]['base_stat'],
      attack: json['stats'][1]['base_stat'],
      defense: json['stats'][2]['base_stat'],
      spAtk: json['stats'][3]['base_stat'],
      spDef: json['stats'][4]['base_stat'],
      speed: json['stats'][5]['base_stat'],
      species: json['species']['name'],
      height: json['height'] / 10,
      weight: json['weight'] / 10,
      abilities: (json['abilities'] as List<dynamic>?)
              ?.map((ability) => ability['ability']['name'] as String)
              .toList() ??
          [],
      url: json['url'] ?? '',
      moves: (json['moves'] as List<dynamic>?)
              ?.map((move) => move['move']['name'] as String)
              .toList() ??
          [],
    );
  }
}
