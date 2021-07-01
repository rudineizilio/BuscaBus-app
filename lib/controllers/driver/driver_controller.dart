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

  // @observable
  // ObservableStream<DateTime> currentDate = Stream.periodic(Duration(seconds: 1))
  //   .map((_) => DateTime.now()).asObservable();  

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
  void getPosition() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
      .then((Position position) {
        driverPosition = position;        
      }).catchError((e) {
        print(e);
      });

      print('${driverPosition.latitude} | ${driverPosition.longitude} | ${driverPosition.timestamp}');
  }

  @computed
  bool get sharedButtonEnabled => (busSelected != null && lineSelected != null) ? true : false;  

  // @computed
  // DateTime get now => currentDate.value ?? DateTime.now();

  // @computed
  // bool get dateInterval {
  //   return (now.difference(DateTime.parse(loginDate)).inMinutes >= 5) && (appReview == null || appReview == 'pending');
  // }
}