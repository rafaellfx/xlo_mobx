import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extensions.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/repositories/user_repository.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {


  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 6;
  String get nameError {
    if(name == null || nameValid){
      return null;
    }else if( name.isEmpty){
      return 'Campo obrigratório!';
    }else{
      return 'Nome muito curto';
    }
  }

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValue => email != null && email.isEmailValid();
  String get emailError{
    if(email == null || email.isEmailValid()){
      return null;
    }else if(email.isEmpty){
      return "Campo obrigatório";
    }else{
      return "E-mail inválido";
    }
  }

  @observable
  String phone;

  @action
  void setPhone(String value) => email = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError{
    if(phone == null || phoneValid){
      return null;
    }else if(phone.isEmpty){
      return "Campo obrigatório";
    }else{
      return "Celular inválido";
    }
  }

  @observable
  String pass1;

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get pass1Valid => pass1 != null && pass1.length > 4;
  String get pass1Error{
    if(pass1 == null || pass1Valid){
      return null;
    }else if(pass1.isEmpty){
      return "Campo obrigatório";
    }else{
      return "Senha muito curta";
    }
  }
@observable
  String pass2;

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get pass2Valid => pass2 != null && pass1 == pass2;
  String get pass2Error{
    if(pass2 == null || pass2Valid){
      return null;
    }else{
      return "Senhas não conhecidem";
    }
  }

  @computed
  bool get isFormValid => nameValid && emailValue && phoneValid && pass1Valid && pass2Valid;

  @computed
  Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _signUp() async {
    loading = false;

    final user = User(
      name: name,
      email: email,
      password: pass1
    );
    try {
      final resultUser = await UserRepository().signUp(user);
      print(resultUser);
    }catch(e){
      error = e;
    }
    loading = true;
  }

}