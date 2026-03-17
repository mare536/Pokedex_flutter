import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pokemon.dart';

class PokemonRepository {
  static const String _url = 
      'https://api.codetabs.com/v1/proxy?quest=https://www.vidalibarraquer.net/android/flutter/pokemon_by_gen.json';
  
  Map<String, List<Pokemon>>? _cache;

  Future<List<Pokemon>> getPokemonsByGeneration(int genId) async {
    if (_cache == null) {
      final res = await http.get(Uri.parse(_url));
      if (res.statusCode != 200) throw Exception('Error HTTP');

      _cache = {};
      final Map<String, dynamic> body = jsonDecode(res.body);
      
      body.forEach((key, value) {
        _cache![key] = (value as List).map((json) => Pokemon.fromJson(json)).toList();
      });
    }

    return _cache!['gen$genId'] ?? [];
  }
}