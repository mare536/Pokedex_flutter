import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pokemon.dart';

class PokemonRepository {
  // Mantenemos el proxy para evadir CORS en Chrome Web
  static const String _baseUrl = 'https://api.codetabs.com/v1/proxy?quest=https://www.vidalibarraquer.net/android/flutter/pokemon.json';

  Future<List<Pokemon>> getPokemon() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        // El nodo raíz del JSON proporcionado es "pokemon", no "data"
        final List<dynamic> pokemonList = body['pokemon'];
        return pokemonList.map((json) => Pokemon.fromJson(json)).toList();
      } else {
        throw Exception('Error HTTP ${response.statusCode}');
      }
    } catch (e) {
      // Capturamos fallos de red o errores al parsear la estructura del JSON
      throw Exception('Error al obtener los Pokemons: $e');
    }
  }
}