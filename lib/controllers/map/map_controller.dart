import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'map_controller.g.dart';

class MapController = _MapController with _$MapController;

abstract class _MapController with Store {

  @observable
  Future<Position> _determinePosition;

  @observable
  bool serviceEnabled = false;

  @observable
  LocationPermission locationPermission;

  @action
  Future<void> getPosition() async {
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

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

}