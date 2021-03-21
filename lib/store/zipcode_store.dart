import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/repositories/zipcode_repository.dart';

part 'zipcode_store.g.dart';

class ZipcodeStore = _ZipcodeStore with _$ZipcodeStore;

abstract class _ZipcodeStore with Store {


  _ZipcodeStore(){
    autorun((_){
      if(clearZipcode.length != 8){
        _reset();
      }else{
        _searchZipcode();
      }
    });
  }


  @observable
  String zipcode = '';

  @action
  void setZipcode(String valeu) => zipcode = valeu;

  @computed
  String get clearZipcode => zipcode.replaceAll(RegExp('[ˆˆ-9]'), 'replace');

  @observable
  bool loading = false;

  @observable
  String error;

  @observable
  Address address;

  @action
  Future<void> _searchZipcode() async {
    loading = true;
    try {
      address = await ZipcodeRepository().getAddressFromApi(clearZipcode);

    }catch (e){
      error = e;
    }
    loading = false;
  }

  @action
  void _reset(){
    address = null;
    error = null;
  }
}