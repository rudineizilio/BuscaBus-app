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
    print('aaaaaaaaaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
    print(driver);

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
}