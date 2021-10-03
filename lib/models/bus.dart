class Bus {
  String licensePlate;

  Bus({this.licensePlate});

  static Bus fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Bus(
      licensePlate: map['licensePlate'],
    );
  }  

  Map<String, dynamic> toMap() {
    return {
      'licensePlate': licensePlate,
    };
  }
}