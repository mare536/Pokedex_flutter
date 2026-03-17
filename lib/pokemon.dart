class Pokemon {
  final String id;
  final String name;
  final String type;
  final String description;

  Pokemon({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json){
    return Pokemon(
      id: json['id'] as String, 
      name: json['name'] as String, 
      type: json['type'] as String, 
      description: json['description'] as String
    );
  }

  String get imageUrl{
    const String proxy = 'https://api.codetabs.com/v1/proxy?quest=';
    const String baseUrl = 'https://www.vidalibarraquer.net/android/flutter/pokemons_images/pokemons';
    return '$proxy$baseUrl/$id.png';
  }
}