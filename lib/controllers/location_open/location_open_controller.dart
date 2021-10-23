import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'location_open_controller.g.dart';

class LocationOpenController = _LocationOpenController with _$LocationOpenController;

abstract class _LocationOpenController with Store {
  @observable
  CollectionReference locationOpen = FirebaseFirestore.instance.collection('location_open');
}