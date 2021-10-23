import 'package:buscabus/models/location_close.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'location_close_controller.g.dart';

class LocationCloseController = _LocationCloseController with _$LocationCloseController;

abstract class _LocationCloseController with Store {
  @observable
  CollectionReference locationClose = FirebaseFirestore.instance.collection('location_close');

  @action
  Future<void> addCloseLocation(LocationClose location) async {
    return locationClose
      .add(location.toMap())
      .catchError((error) => print("Location added failed: $error"));
  }
}