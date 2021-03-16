import 'package:dio/dio.dart';
import 'package:xlo_mobx/models/uf.dart';

class IBGERepository {
  Future<List<UF>> getUFListFromIpa() async {
    const endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    try {
      final response = await Dio().get<List>(endpoint);
      final ufList = response.data.map<UF>((j) => UF.fromJson(j)).toList()
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      return ufList;
    } on DioError {
      return Future.error("Falha a obter lista de Estados");
    }
  }

  getCityListFromIpa() {}
}
