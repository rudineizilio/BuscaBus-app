class Bus {
  String licensePlate;

  Bus({this.licensePlate});

  Bus.fromJson(Map<String, dynamic> json) {
    licensePlate = json['license_plate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['license_plate'] = this.licensePlate;
    return data;
  }
}