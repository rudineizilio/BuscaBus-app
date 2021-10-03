import 'package:buscabus/models/bus.dart';
import 'package:buscabus/models/driver.dart';
import 'package:buscabus/models/line.dart';
import 'package:buscabus/models/stop.dart';

class Company {
  int password;
  int cnpj;
  String email;
  List<Bus> bus;
  List<Driver> driver;
  List<Line> lines;
  List<Stop> stops;

  Company({
    this.password,
    this.cnpj,
    this.email,
    this.bus,
    this.driver,
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
      driver: map['driver'],
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
      'driver': driver,
      'lines': lines,
      'stops': stops,
    };
  }
}