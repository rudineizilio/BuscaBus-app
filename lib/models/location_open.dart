import 'package:cloud_firestore/cloud_firestore.dart';

class LocationOpen {
  String bus;
  String driver;
  DateTime startDate;
  DateTime lastUpdate;
  String line;
  GeoPoint location;

  LocationOpen({
    this.bus,
    this.driver,
    this.startDate,
    this.lastUpdate,
    this.line,
    this.location
  });

  static LocationOpen fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LocationOpen(
      bus: map['bus'],
      driver: map['driver'],
      startDate: map['startDate'],
      lastUpdate: map['lastUpdate'],
      line: map['line'],
      location: map['location'],
    );
  }  

  Map<String, dynamic> toMap() {
    return {
      'bus': bus,
      'driver': driver,
      'startDate': startDate,
      'lastUpdate': lastUpdate,
      'line': line,
      'location': location,
    };
  }
}
