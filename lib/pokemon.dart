class Pokemon {
  final String id;
  final String name;
  final String species;
  final String type;
  final String height;
  final String weight;
  final String abilities;
  final int statsHp;
  final int statsAttack;
  final int statsDefense;
  final int statsSpAtk;
  final int statsSpDef;
  final int statsSpeed;
  final int statsTotal;
  final String evolution;
  final String description;

  const Pokemon({
    required this.id,
    required this.name,
    required this.species,
    required this.type,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.statsHp,
    required this.statsAttack,
    required this.statsDefense,
    required this.statsSpAtk,
    required this.statsSpDef,
    required this.statsSpeed,
    required this.statsTotal,
    required this.evolution,
    required this.description,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as String,
      name: json['name'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      height: json['height'] as String,
      weight: json['weight'] as String,
      abilities: json['abilities'] as String,
      statsHp: json['stats_hp'] as int,
      statsAttack: json['stats_attack'] as int,
      statsDefense: json['stats_defense'] as int,
      statsSpAtk: json['stats_sp.atk'] as int, // Mapeo de clave con caracteres especiales
      statsSpDef: json['stats_sp.def'] as int,
      statsSpeed: json['stats_speed'] as int,
      statsTotal: json['stats_total'] as int,
      evolution: json['evolution'] as String,
      description: json['description'] as String,
    );
  }

  String get imageUrl => 
      'https://api.codetabs.com/v1/proxy?quest=https://www.vidalibarraquer.net/android/flutter/pokemons_images/pokemons/$id.png';
}