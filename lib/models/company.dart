class Company {
  String name;
  String cnpj;

  Company({ this.name, this.cnpj });

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cnpj = json['cnpj'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cnpj'] = this.cnpj;
    return data;
  }
}