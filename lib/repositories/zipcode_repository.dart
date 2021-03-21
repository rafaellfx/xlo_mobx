import 'package:dio/dio.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/repositories/ibge_repository.dart';

class ZipcodeRepository {

  Future<Address> getAddressFromApi(String zipcode) async {
    if (zipcode == null || zipcode.isEmpty) {
      return Future.error("CEP inválido");
    }
    final clearZipcode = zipcode.replaceAll(RegExp('[ˆ0-9]'), '');
    if (clearZipcode.length != 8) {
      return Future.error("CEP inválido");
    }

    final endpoint = 'http://viacep.com.br/ws/$clearZipcode/json';

    try {
      final response = await Dio().get<Map>(endpoint);

      if (response.data.containsKey("erro") && response.data['erro']) {
        return Future.error("CEP inválido");
      }

      final ufList = await IBGERepository().getUFList();

      Address(
          zipcode: response.data['cep'],
          district: response.data['bairro'],
          city: City(name: response.data['localidade']),
          uf: ufList.firstWhere((uf) => uf.initials == response.data['uf']));

    } catch (e) {
      return Future.error("Falha ao buscar CEP");
    }
  }
}
