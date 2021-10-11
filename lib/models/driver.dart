class Driver {
  String password;
  String cpf;
  String name;
  String email;

  Driver({
    this.password,
    this.cpf,
    this.name,
    this.email
  });

  static Driver fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Driver(
      password: map['password'],
      cpf: map['cpf'],
      name: map['name'],
      email: map['email'],
    );
  }  

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'cpf': cpf,
      'name': name,
      'email': email,
    };
  }
}