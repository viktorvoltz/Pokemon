import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokemon/model/PokeModel.dart';
import 'package:pokemon/services/http.dart';
import 'package:pokemon/services/httpStatus.dart';

class PokemonProvider extends ChangeNotifier{
  bool _isLoading = false;
  PokenModel? _pokemonData;

  bool get loading => _isLoading;
  PokenModel? get pokemonData => _pokemonData;

  PokemonProvider(){
    getData();
  }

  setLoading(bool loading) async{
    _isLoading = loading;
    notifyListeners();
  }

  setPokemonData(PokenModel pokemonData){
    _pokemonData = pokemonData;
    notifyListeners();
  }

  getData() async{
    setLoading(true);
    var response = await GetPokemonData.getData();
    if (response is Success){
      setPokemonData(response.response as PokenModel);
    }
    setLoading(false);
  }

}