class Driver {
  int password;
  String cpf;
  String name;
  String email;

  Driver({
    this.password,
    this.cpf,
    this.name,
    this.email
  });

  Driver.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    cpf = json['cpf'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['cpf'] = this.cpf;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}