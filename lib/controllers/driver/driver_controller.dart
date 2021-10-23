import 'dart:async';
import 'package:buscabus/models/driver.dart';
import 'package:buscabus/models/location_open.dart';
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

  @observable
  CollectionReference company = FirebaseFirestore.instance.collection('company');

  @observable
  CollectionReference locationClose = FirebaseFirestore.instance.collection('location_close');

  @observable
  CollectionReference locationOpen = FirebaseFirestore.instance.collection('location_open');

  @observable
  List<Driver> drivers = [];

  @observable
  LocationOpen currentLocation;

  @observable
  String currentLocationId;

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
  void setSharedLocation(bool value) {
    sharedLocation = value;
  }

  @action
  Future<void> openDriverLocation(LocationOpen location) async {
    currentLocation = location;

    await addDriverLocation(currentLocation);

    locationInTime;
  }

  @action
  Future<void> addDriverLocation(LocationOpen location) async {
    DocumentReference docRef = await locationOpen.add(location.toMap());

    currentLocationId = docRef.id;
  }

  @action
  Future<void> deleteDriverLocation() async {
    await locationClose.add(currentLocation.toMap()).catchError((error) => print('Failed to add Location: $error'));

    return locationOpen
      .doc(currentLocationId)
      .delete()
      .catchError((error) => print('Failed to delete Driver: $error'));    
  }

  @action
  Future<void> updateDriverLocation() {
    return driverLocation
      .doc(currentLocationId)
      .update({
        'bus': currentLocation.bus,
        'driver': currentLocation.driver,
        'start': currentLocation.startDate,
        'line': currentLocation.line,
        'lastUpdate': driverPosition.timestamp,
        'location': GeoPoint(driverPosition.latitude, driverPosition.longitude),
      })
      .catchError((error) => print("Location update failed: $error"));
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

  @action
  void setTimerPeriodic() {
    print('chamouuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu o periodiccccccccccccc');
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) => getPosition());
  }

  @action
  void cancelTimer() {
    print('chamouuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu o cencellllllllllllllllll');
    timer.cancel();
  }

  @computed
  bool get sharedButtonEnabled => (busSelected != null && lineSelected != null) ? true : false;

  @computed 
  get locationInTime async {
    if (sharedLocation) {
      setTimerPeriodic();
    } else {
      cancelTimer();
    }
  }
}