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
<<<<<<< HEAD
          
          // Información General
          _buildRow('ID', pokemon.id),
          _buildRow('Nombre', pokemon.name),
          _buildRow('Especie', pokemon.species),
          _buildRow('Tipo', pokemon.type),
          _buildRow('Altura', pokemon.height),
          _buildRow('Peso', pokemon.weight),
          _buildRow('Habilidades', pokemon.abilities),
          _buildRow('Evolución', pokemon.evolution),
          const SizedBox(height: 16),
          
          // Estadísticas de Combate
          const Text('Estadísticas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          _buildRow('HP', pokemon.statsHp.toString()),
          _buildRow('Ataque', pokemon.statsAttack.toString()),
          _buildRow('Defensa', pokemon.statsDefense.toString()),
          _buildRow('Ataque Especial', pokemon.statsSpAtk.toString()),
          _buildRow('Defensa Especial', pokemon.statsSpDef.toString()),
          _buildRow('Velocidad', pokemon.statsSpeed.toString()),
          _buildRow('Total', pokemon.statsTotal.toString()),
          const SizedBox(height: 16),
          
          // Descripción
          const Text('Descripción', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
=======
          Text('ID: ${pokemon.id}', style: const TextStyle(fontSize: 20)),
          Text('Tipo: ${pokemon.type}', style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
>>>>>>> 487e45513efc9f51bab2a952a1a747cf7ad2dd38
          Text(pokemon.description, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
<<<<<<< HEAD

  // Extracción de widget: Previene el código repetitivo (Boilerplate)
  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
=======
>>>>>>> 487e45513efc9f51bab2a952a1a747cf7ad2dd38
}