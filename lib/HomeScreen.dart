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
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: screen(pokemonProvider),
        ),
      ],
    ));
  }

  Widget screen(PokemonProvider pokemonProvider) {
    if (pokemonProvider.loading) {
      return const Text('Loading, wait!');
    }
    return Column(
      children: [
        Text(
          "Ability URL" +
              " " +
              pokemonProvider.pokemonData!.abilities![0].ability!.url
                  .toString(),
        ),
        Text(
          "Ability NAME" +
              " " +
              pokemonProvider.pokemonData!.abilities![0].ability!.name
                  .toString(),
        ),
        Text(
          "Ability SLOT" +
              " " +
              pokemonProvider.pokemonData!.abilities![0].slot!
                  .toString(),
        ),
      ],
    );
  }
}
