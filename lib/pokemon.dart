class Pokemon {
  final String id;
  final String name;
  final String type;
  final String description;

  const Pokemon({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
    );
  }

  String get imageUrl => 
      'https://api.codetabs.com/v1/proxy?quest=https://www.vidalibarraquer.net/android/flutter/pokemons_images/pokemons/$id.png';
}