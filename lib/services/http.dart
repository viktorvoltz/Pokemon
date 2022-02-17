import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pokemon/model/PokeModel.dart';
import 'package:pokemon/services/httpStatus.dart';
import 'dart:convert';
import 'package:pokemon/utils/api.dart';

class GetPokemonData {
  static Future<Object> getData() async {
    try {
      final response = await http.get(
        Uri.parse(API_KEY),
      );
      if (response.statusCode == 200) {
        return Success(response: pokenModelFromJson(response.body));
      }
      return Failure(code: 100, response: 'Invalid Response');
    } on HttpException {
      return Failure(code: 101, response: 'No Internet');
    } on FormatException {
      return Failure(code: 102, response: 'Invalid Format');
    } catch (e) {
      return Failure(code: 103, response: 'Invalid Response');
    }
  }
}
