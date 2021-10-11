class LocationClose {
  String bus;
  String driver;
  DateTime startDate;
  DateTime endDate;
  String line;

  LocationClose({
    this.bus,
    this.driver,
    this.startDate,
    this.endDate,
    this.line,
  });

  static LocationClose fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LocationClose(
      bus: map['bus'],
      driver: map['driver'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      line: map['line'],    
    );
  }  

  Map<String, dynamic> toMap() {
    return {
      'bus': bus,
      'driver': driver,
      'startDate': startDate,
      'endDate': endDate,
      'line': line,
    };
  }
}
