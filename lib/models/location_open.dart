import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationOpen {
  String bus;
  String driver;
  DateTime startDate;
  DateTime endDate;
  DateTime lastUpdate;
  String line;
  LatLng location;

  LocationOpen({
    this.bus,
    this.driver,
    this.startDate,
    this.endDate,
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
      endDate: map['endDate'],
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
      'endDate': endDate,
      'lastUpdate': lastUpdate,
      'line': line,
      'location': location,
    };
  }
}
