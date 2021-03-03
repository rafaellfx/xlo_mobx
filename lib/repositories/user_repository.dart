import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/repositories/parse_erros.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';

class UserRepository {

  Future<User> signUp(User user) async {

    final parseUser = ParseUser(user.email, user.password, user.email);

    parseUser.set<String>(KeyUserName, user.name);
    parseUser.set<String>(KeyUserPhone, user.phone);
    parseUser.set(KeyUserType, user.type.index);

    final response = await parseUser.signUp();

    if(response.success){
      return mapParseToUser(response.result);
    }else{
      return Future.error(ParseErrors.getDescription(response.error.code));
    }

  }

  User mapParseToUser(ParseUser parseUser){
    return User(
      id: parseUser.objectId,
      name: parseUser.get(KeyUserName),
      email: parseUser.get(KeyUserEmail),
      phone: parseUser.get(KeyUserPhone),
      type: UserType.values[parseUser.get(KeyUserType)],
      createdAt: parseUser.get(KeyUserCreatedAt)
    );
  }

  Future<User> loginWithEmail(String email, String password) async {

    final parseUser = ParseUser(email, password, null);
    final response = await parseUser.login();
    if (response.success){
      return mapParseToUser(response.result);
    }else{
      return Future.error(ParseErrors.getDescription(response.error.code));
    }

  }


}