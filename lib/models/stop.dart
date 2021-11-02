import 'package:cloud_firestore/cloud_firestore.dart';

class Stop {
  String description;
  GeoPoint location;

  Stop({
    this.description,
    this.location,
  });

  static Stop fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Stop(
      description: map['description'],
      location: map['location'],
    );
  }  

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'location': location,
    };
  }
}