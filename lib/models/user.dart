enum UserType {PARTICULAR, PROFESSIONAL}

class User {
  String name;
  String email;
  String password;
  String phone;
  UserType type;

  User({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.type = UserType.PARTICULAR
  });
}