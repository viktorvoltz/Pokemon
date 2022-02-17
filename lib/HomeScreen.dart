import 'package:flutter/material.dart';
import 'package:pokemon/services/http.dart';
import 'package:pokemon/viewmodels/pokemonProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    PokemonProvider? pokemonProvider = Provider.of<PokemonProvider>(context);
    return Scaffold(
        body: Container(
      child: Center(child: screen(pokemonProvider)),
    ));
  }

  Widget screen(PokemonProvider pokemonProvider) {
    if (pokemonProvider.loading) {
      return Text('Loading, wait!');
    }
    return Text(pokemonProvider.pokemonData!.abilities![0].ability!.url.toString());
  }
}
