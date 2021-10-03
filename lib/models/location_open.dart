import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationOpen {
  String bus;
  String driver;
  DateTime start;
  DateTime end;
  DateTime lastUpdate;
  String line;
  LatLng location;

  LocationOpen({
    this.bus,
    this.driver,
    this.start,
    this.end,
    this.lastUpdate,
    this.line,
    this.location
  });

  static LocationOpen fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LocationOpen(
      bus: map['bus'],
      driver: map['driver'],
      start: map['start'],
      end: map['end'],
      lastUpdate: map['lastUpdate'],
      line: map['line'],
      location: map['location'],
    );
  }  

  Map<String, dynamic> toMap() {
    return {
      'bus': bus,
      'driver': driver,
      'start': start,
      'end': end,
      'lastUpdate': lastUpdate,
      'line': line,
      'location': location,
    };
  }
}
