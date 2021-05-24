class Driver {
  String name;
  String cpf;

  Driver({ this.name, this.cpf });

  Driver.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cpf = json['cpf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cpf'] = this.cpf;
    return data;
  }
}
