import 'package:flutter/material.dart';

import 'pokemon.dart';
import 'pokemon_repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: PokemonListPage(),
    );
  }
}


class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final PokemonRepository _repository = PokemonRepository();

  List<Pokemon> _pokemons = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final data  = await _repository.getPokemon();
      if (!mounted) {
        setState(() {
          _pokemons = data;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;
      
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }
  
  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_errorMessage != null) {
      return Center(child: Text(_errorMessage!, style: const TextStyle(color: Colors.red, fontSize: 18), textAlign: TextAlign.center,),);
    }

    return ListView.builder(
      itemCount: _pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = _pokemons[index];
        return ListTile(
          // Consumimos el Getter dinámico que creamos en el modelo
          leading: Image.network(
            pokemon.imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => 
                const Icon(Icons.broken_image, size: 40, color: Colors.grey),
          ),
          title: Text('${pokemon.id} - ${pokemon.name}'),
          subtitle: Text('Tipo: ${pokemon.type}'),
          trailing: const Icon(Icons.chevron_right), // Indicador de navegación
          onTap: () {
            // TODO: Navegación a la pantalla de detalle
          },
        );
      },
    );
  }
}