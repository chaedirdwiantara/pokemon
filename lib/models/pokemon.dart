class Pokemon {
  final String name;
  final String url;
  final String imageUrl;

  Pokemon({required this.name, required this.url, required this.imageUrl});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'] ?? 'Unknown',
      url: json['url'] ?? '',
      imageUrl:
          json['sprites'] != null ? json['sprites']['front_default'] ?? '' : '',
    );
  }
}
