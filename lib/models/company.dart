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

  Company.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    cnpj = json['cnpj'];
    email = json['email'];

    if (json['bus'] != null) {
      bus = new List<Bus>();
      json['bus'].forEach((v) {
        bus.add(new Bus.fromJson(v));
      });
    }

    if (json['driver'] != null) {
      driver = new List<Driver>();
      json['driver'].forEach((v) {
        driver.add(new Driver.fromJson(v));
      });
    }
    
    if (json['lines'] != null) {
      lines = new List<Line>();
      json['lines'].forEach((v) {
        lines.add(new Line.fromJson(v));
      });
    }

    if (json['stops'] != null) {
      stops = new List<Stop>();
      json['stops'].forEach((v) {
        stops.add(new Stop.fromJson(v));
      });
    } 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['cnpj'] = this.cnpj;
    data['email'] = this.email;
    
    if (this.bus != null) {
      data['bus'] = this.bus.map((v) => v.toJson()).toList();
    }
    
    if (this.driver != null) {
      data['driver'] = this.driver.map((v) => v.toJson()).toList();
    }
    
    if (this.lines != null) {
      data['lines'] = this.lines.map((v) => v.toJson()).toList();
    }

    if (this.stops != null) {
      data['stops'] = this.stops.map((v) => v.toJson()).toList();
    }    
    
    return data;
  }
}