import 'package:flutter/material.dart';
import 'pokemon.dart';
import 'pokemon_repository.dart';
import 'pokemon_detail_page.dart';

class PokemonListPage extends StatelessWidget {
  final int genId;
  final PokemonRepository repository;

  const PokemonListPage({super.key, required this.genId, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gen $genId')),
      body: FutureBuilder<List<Pokemon>>(
        future: repository.getPokemonsByGeneration(genId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final pokemons = snapshot.data!;
          return ListView.builder(
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              final pokemon = pokemons[index];
              return ListTile(
                // Forzamos un contenedor estricto para evitar colapsos de tamaño en el renderizado
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(
                    pokemon.imageUrl,
                    fit: BoxFit.contain,
                    // Si falla la descarga, dibuja un icono dentro de los mismos 50x50
                    errorBuilder: (context, error, stackTrace) => 
                        const Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                ),
                title: Text(pokemon.name),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PokemonDetailPage(pokemon: pokemon),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}