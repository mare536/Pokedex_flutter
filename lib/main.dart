import 'package:flutter/material.dart';
import 'pokemon_repository.dart';
import 'pokemon_list_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GenerationsPage(),
    );
  }
}

class GenerationsPage extends StatelessWidget {
  final PokemonRepository _repo = PokemonRepository();

  GenerationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generaciones')),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          final int genId = index + 1;
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PokemonListPage(genId: genId, repository: _repo),
              ),
            ),
            child: Image.network(
              'https://api.codetabs.com/v1/proxy?quest=https://www.vidalibarraquer.net/android/flutter/generation$genId.png',
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}