enum UserType {PARTICULAR, PROFESSIONAL}

class User {
  String id;
  String name;
  String email;
  String password;
  String phone;
  UserType type;
  DateTime createdAt;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.type = UserType.PARTICULAR,
    this.createdAt
  });

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, password: $password, phone: $phone, type: $type, createdAt: $createdAt}';
  }
}