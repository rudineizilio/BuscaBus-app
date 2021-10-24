import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  @observable
  String filterType = 'lines';

  @observable
  List<Marker> markers = <Marker>[];

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

  @action
  void setFilterType(String value) {
    filterType = value;
  }

  @action
  void addMarkers(List<dynamic> stops, List<dynamic> locationsOpen) {
    print(filterType);
    if (filterType == 'lines') {
      markers.clear();

      locationsOpen.forEach((location) async {
        markers.add(
          Marker(
            markerId: MarkerId(location['location'].toString()),
            position: LatLng(location['location'].latitude, location['location'].longitude),
            infoWindow: InfoWindow(
              title: location['line'],              
            ),
            // icon: await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'lib/assets/images/bus.png'),
          ),
        );
      });
    } 
    
    if (filterType == 'stops') {
      markers.clear();

      stops.forEach((stop) async {
        markers.add(
          Marker(
            markerId: MarkerId(stop['description']),
            position: LatLng(double.parse(stop['location'].split(',').first.trim()), double.parse(stop['location'].split(',').last.trim())),
            infoWindow: InfoWindow(
              title: stop['description'],
            ),
            // icon: await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'lib/assets/images/bus-stop.png'),
          ),
        );
      });
    }
  }  
}