import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/store/zipcode_store.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {

  ObservableList images = ObservableList();

  @computed
  bool get imagesValid => images.isNotEmpty;
  String get imagesError{
    if(!showError || imagesValid) return null;
    else return 'Insira imagens';
  }

  @observable
  String title = '';

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 6;
  String get titleError {
    if(!showError || titleValid) return null;
    else if(title.isEmpty) return "Campo obrigatório";
    else  return 'Título muito curto';
  }

  @observable
  String description = '';

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description.length >= 10;
  String get descriptionError {
    if(!showError || descriptionValid) return null;
    else if(description.isEmpty) return "Campo obrigatório";
    else  return 'Descrição muito curta';
  }

  @observable
  Category category;

  @action
  void setCategory(Category valeu) => category = valeu;

  @computed
  bool get categoryValid => category != null;
  String get categoryError {
    if(!showError || categoryValid) return null;
    else return "Campo obrigaório";

  }

  ZipcodeStore zipcodeStore = ZipcodeStore();

  @computed
  Address get address => zipcodeStore.address;
  bool get addressValid => address != null;
  String get addressError {
    if(!showError || addressValid) return null;
    else return 'Campo obrigatório';
  }

  @observable
  String priceText = '';

  @action
  void setPrice(String value) => priceText = value;

  @computed
  num get price {
    if(priceText.contains(",")){
      return num.tryParse(priceText.replaceAll(RegExp('[ˆ0-9]'), '')) / 100;
    }else{
      return num.tryParse(priceText);
    }
  }
  bool get priceValid => price != null && price <= 9999999;
  String get priceError {
    if(!showError || priceValid) return null;
    else if(!showError || priceText.isEmpty) return 'Campo obrigatório';
    else return 'Campo inválido.';
  }

  @observable
  bool hidePhone = false;

  @action
  void setHidePhone(bool value) => hidePhone = value;

  @computed
  bool get formValid => imagesValid
      && titleValid
      && descriptionValid
      && categoryValid
      && addressValid
      && priceValid;

  @computed
  Function get sendPressed => formValid  ? _send : null;

  void _send(){

  }

  @observable
  bool showError = false;

  @action
  void invalidSendPressed() => showError = true;

}