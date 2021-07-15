import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'driver_controller.g.dart';

class DriverController = _DriverController with _$DriverController;

abstract class _DriverController with Store {
  @observable
  String busSelected;

  @observable
  String lineSelected;

  @observable
  bool sharedLocation = false;

  @observable
  Position driverPosition;

  @observable
  bool serviceEnabled = false;

  @observable
  LocationPermission locationPermission;

  @observable
  Timer timer;

  @observable
  CollectionReference driverLocation = FirebaseFirestore.instance.collection('location');

  @action
  void setBus(String value) {
    busSelected = value;
  }

  @action
  void setLine(String value) {
    lineSelected = value;
  }

  @action
  void setCharedLocation() {
    sharedLocation = !sharedLocation;
  }

  @action
  Future<void> getLocationEnabled() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Solicitar ao usuário para ativar o serviço de localização');
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }

    if (locationPermission == LocationPermission.deniedForever) {
      locationPermission = await Geolocator.requestPermission();
    }
  }

  @action
  Future<void> updateDriverLocation() {    
    // LocationOpen location = LocationOpen(
    //   bus: "AXD-0000",
    //   driver: "Rudão Motora",
    //   start: DateTime.now(),
    //   end: DateTime.now(),
    //   lastUpdate: driverPosition.timestamp,
    //   line: "Linha-TESTE",
    //   location: LatLng(driverPosition.latitude, driverPosition.longitude),
    // );

    // Map<String, LocationOpen> data = {
    //   'location': location
    // };

    return driverLocation
      .doc('KArObpNBylILV0xc6N9u')
      .update({
          "bus": "AXD-0000",
          "driver": "Rudão Motora",
          "start": DateTime.now(),
          "end": DateTime.now(),
          "lastUpdate": driverPosition.timestamp,
          "line": "Linha-TESTE",
          "location": GeoPoint(driverPosition.latitude, driverPosition.longitude),
      })
      .then((value) => print("Location atualizada"))
      .catchError((error) => print("Falha na atualização da Location: $error"));
  }  

  @action
  Future<void> getPosition() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
      .then((Position position) {
        driverPosition = position;        
      }).catchError((e) {
        print(e);
      });

      updateDriverLocation();
  }

  @computed
  bool get sharedButtonEnabled => (busSelected != null && lineSelected != null) ? true : false;

  @computed 
  get locationInTime async {
    if (sharedLocation) {
      timer = Timer.periodic(Duration(seconds: 2), (Timer t) => getPosition());
    } else {
      timer.cancel();
    }
  }
}