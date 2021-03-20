import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';

class IBGERepository {
  final endpoint =
      'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

  Future<List<UF>> getUFList() async {
    final preferences = await SharedPreferences.getInstance();

    List<dynamic> listJson;

    if (preferences.containsKey("UF_LIST")) {
      listJson = json.decode(preferences.get("UF_LIS"));
    } else {
      try {
        final response = await Dio().get<List>(endpoint);
        preferences.setString("UF_LIST", json.encode(response.data));
        listJson = response.data;
      } on DioError {
        return Future.error("Falha a obter lista de Estados");
      }
    }

    return await _getListFromApi(UF(), listJson);
  }

  Future<List<City>> getCityListFromApi(UF uf) async {
    try {
      final response = await Dio().get<List>('$endpoint/${uf.id}/municipios');
      return await _getListFromApi(City(), response.data);
    } on DioError {
      return Future.error("Falha a obter lista de Municipio");
    }
  }

  Future<List> _getListFromApi(object, List<dynamic> listJson) async {
    return listJson.map((j) => object.fromJson(j)).toList()
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }
}
