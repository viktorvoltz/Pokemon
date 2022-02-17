import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokemon/model/PokeModel.dart';
import 'package:pokemon/services/http.dart';
import 'package:pokemon/services/httpStatus.dart';

class PokemonProvider extends ChangeNotifier{
  bool _isLoading = false;
  PokenModel? _pokemonData;
  Failure? _error;

  bool get loading => _isLoading;
  PokenModel? get pokemonData => _pokemonData;
  Failure? get error => _error;

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

  setError(Failure error){
    _error = error;
  }

  getData() async{
    setLoading(true);
    var response = await GetPokemonData.getData();
    if (response is Success){
      setPokemonData(response.response as PokenModel);
    }
    if (response is Failure){
      Failure error = Failure(
        code: response.code,
        response: response.response
      );
      setError(error);
    }
    setLoading(false);
  }

}