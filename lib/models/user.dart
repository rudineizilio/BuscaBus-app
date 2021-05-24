class User {
  String company;
  String driver;
  String email;
  String password;

  User({
    this.company,
    this.driver,
    this.email,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    driver = json['driver'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['driver'] = this.driver;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
