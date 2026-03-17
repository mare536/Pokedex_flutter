import 'package:flutter/material.dart';
import 'pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name)),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Image.network(pokemon.imageUrl, height: 200, fit: BoxFit.contain),
          const SizedBox(height: 20),
          Text('ID: ${pokemon.id}', style: const TextStyle(fontSize: 20)),
          Text('Tipo: ${pokemon.type}', style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Text(pokemon.description, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}