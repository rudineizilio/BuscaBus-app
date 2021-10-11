import 'package:buscabus/models/bus.dart';
import 'package:buscabus/models/driver.dart';
import 'package:buscabus/models/line.dart';
import 'package:buscabus/models/stop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'company_controller.g.dart';

class CompanyController = _CompanyController with _$CompanyController;

abstract class _CompanyController with Store {

  @observable
  CollectionReference company = FirebaseFirestore.instance.collection('company');

  @action
  Future<void> addDriver(Driver driver) {
    return company
      .doc('262gZboPV0OZfjQxzfko')
      .update({'drivers': FieldValue.arrayUnion([driver.toMap()])})
      .then((value) => print('Driver Added'))
      .catchError((error) => print("Failed to add driver: $error"));
  }

  @action
  Future<void> addBus(Bus bus) {
    return company
      .doc('262gZboPV0OZfjQxzfko')
      .update({'bus': FieldValue.arrayUnion([bus.toMap()])})
      .then((value) => print('Bus Added'))
      .catchError((error) => print("Failed to add bus: $error"));
  }

  @action
  Future<void> addLine(Line line) {
    return company
      .doc('262gZboPV0OZfjQxzfko')
      .update({'lines': FieldValue.arrayUnion([line.toMap()])})
      .then((value) => print('Line Added'))
      .catchError((error) => print("Failed to add line: $error"));
  }

  @action
  Future<void> addStop(Stop stop) {
    return company
      .doc('262gZboPV0OZfjQxzfko')
      .update({'stops': FieldValue.arrayUnion([stop.toMap()])})
      .then((value) => print('Stop Added'))
      .catchError((error) => print("Failed to add stop: $error"));
  }

  @action
  Future<void> deleteDriver(dynamic item) {
    return company
      .doc('262gZboPV0OZfjQxzfko')
      .update({'drivers' : FieldValue.arrayRemove([
        {
          'name': item['name'],
          'email': item['email'],
          'cpf': item['cpf'],
          'password': item['password']
        }])})
      .then((value) => print('Driver deleted'))
      .catchError((error) => print('Failed to delete Driver: $error'));
  }

  @action
  Future<void> deleteBus(dynamic item) {
    return company
      .doc('262gZboPV0OZfjQxzfko')
      .update({'bus' : FieldValue.arrayRemove([
        {
          'licensePlate': item['licensePlate'],
        }])})
      .then((value) => print('Bus deleted'))
      .catchError((error) => print('Failed to delete Bus: $error'));
  }

  @action
  Future<void> deleteLine(dynamic item) {
    return company
      .doc('262gZboPV0OZfjQxzfko')
      .update({'lines' : FieldValue.arrayRemove([
        {
          'title': item['title'],
        }])})
      .then((value) => print('Line deleted'))
      .catchError((error) => print('Failed to delete Line: $error'));
  }

  @action
  Future<void> deleteStop(dynamic item) {
    return company
      .doc('262gZboPV0OZfjQxzfko')
      .update({'stops' : FieldValue.arrayRemove([
        {
          'description': item['description'],
          'location': item['location'],
        }])})
      .then((value) => print('Stop deleted'))
      .catchError((error) => print('Failed to delete Stop: $error'));
  }      
}