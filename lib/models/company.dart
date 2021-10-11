import 'package:buscabus/models/bus.dart';
import 'package:buscabus/models/driver.dart';
import 'package:buscabus/models/line.dart';
import 'package:buscabus/models/stop.dart';

class Company {
  int password;
  int cnpj;
  String email;
  List<Bus> bus;
  List<Driver> drivers;
  List<Line> lines;
  List<Stop> stops;

  Company({
    this.password,
    this.cnpj,
    this.email,
    this.bus,
    this.drivers,
    this.lines,
    this.stops,
  });

  static Company fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Company(
      password: map['password'],
      cnpj: map['cnpj'],
      email: map['email'],
      bus: map['bus'],
      drivers: map['drivers'],
      lines: map['lines'],
      stops: map['stops'],
    );
  }  

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'cnpj': cnpj,
      'email': email,
      'bus': bus,
      'drivers': drivers,
      'lines': lines,
      'stops': stops,
    };
  }
}