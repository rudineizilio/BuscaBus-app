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

  LocationOpen.fromJson(Map<String, dynamic> json) {
    bus = json['bus'];
    driver = json['driver'];
    start = json['start'] != null ? DateTime.parse(json['start']).toLocal() : null;
    end = json['end'] != null ? DateTime.parse(json['end']).toLocal() : null;
    lastUpdate = json['lastUpdate'] != null ? DateTime.parse(json['lastUpdate']).toLocal() : null;
    line = json['line'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bus'] = this.bus;
    data['driver'] = this.driver;
    data['start'] = this.start;
    data['end'] = this.end;
    data['lastUpdate'] = this.lastUpdate;
    data['line'] = this.line;
    data['location'] = this.location;
    return data;
  }
}
