import 'package:flutter/material.dart';
import 'package:pokemon/HomeScreen.dart';
import 'package:pokemon/viewmodels/pokemonProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PokemonProvider>(
      create: (_) => PokemonProvider(),
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    ),);
  }
}

