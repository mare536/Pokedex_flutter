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
  String? _error;

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
          _error = e.toString();
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
  }
}