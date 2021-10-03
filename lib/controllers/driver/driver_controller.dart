import 'dart:async';
import 'package:buscabus/widgets/default_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

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

  @observable
  StreamSubscription<Position> positionStream;

  @observable
  String status = 'Aguardando GPS';

  @observable
  Position positionLocation;

  @action
  Future<void> listenPosition() async {
    ph.PermissionStatus permission = await ph.Permission.location.request();

    if (permission.isDenied) {
      DefaultToast(
        message: 'Parece que você não permitiu o uso do GPS, abra as configurações do aplicativo e libere a permissão',
        toastType: DefaultToastType.warning,
      );
    } else {
      bool gpsIsEnabled = await Geolocator.isLocationServiceEnabled();

      if (!gpsIsEnabled)
        DefaultToast(
          message: 'Obtendo a localização',
          toastType: DefaultToastType.info,
        );        
        setStatus('Obtendo a localização');

      positionStream = Geolocator.getPositionStream().listen((Position position) async {
        if (positionLocation == null) {
          positionLocation = position;
          setStatus('Localização obtida');
        }
      });
    }
  }

  @action
  void setStatus(String value) {
    status = value;
  }

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
  Future<void> updateDriverLocation() {
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