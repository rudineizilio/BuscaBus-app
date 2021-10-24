import 'dart:async';

import 'package:buscabus/controllers/company/company_controller.dart';
import 'package:buscabus/controllers/location_open/location_open_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../controllers/map/map_controller.dart';

class MapScreen extends StatefulWidget {

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController _mapController;
  Completer<GoogleMapController> _googleMapController = Completer();
  CompanyController _companyController;
  LocationOpenController _locationOpenController;

  List<Marker> lineMarkers = <Marker>[];
  List<Marker> stopMarkers = <Marker>[];

  dynamic _companyData;
  dynamic _locationOpenData;  

  @override
  void didChangeDependencies() async {
    _mapController = Provider.of<MapController>(context);
    _companyController = Provider.of<CompanyController>(context);
    _locationOpenController = Provider.of<LocationOpenController>(context);

    _mapController.getPosition();    

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {  
    return Flex(
      direction: Axis.vertical,
      children: [
        Flexible(
          child: Container(
            child: Observer(builder: (_) {
              return FutureBuilder(
                future: Future.wait([
                  _companyController.company.doc('262gZboPV0OZfjQxzfko').get(),
                  _locationOpenController.locationOpen.get(),
                ]),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print('Error: ${snapshot.error}');
                  }
                  if (snapshot.hasData) {
                    _companyData = snapshot.data[0];
                    _locationOpenData = snapshot.data[1];
                   
                    addLineMarkers(_locationOpenData.docs);
                    addStopMarkers(_companyData['stops']);

                    return GoogleMap(
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      zoomControlsEnabled: false,  
                      mapToolbarEnabled: _mapController.filterType == 'lines'
                        ? false
                        : true,                  
                      onMapCreated: (GoogleMapController controller) {
                        _googleMapController.complete(controller);
                      },
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(-26.22815111640855, -52.671710505622876),
                        zoom: 13,
                      ),
                      markers: _mapController.filterType == 'lines'
                        ? Set<Marker>.of(lineMarkers)
                        : Set<Marker>.of(stopMarkers),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              );
            }),
          ),
        ),
      ],
    );
  }

  void addLineMarkers(List<dynamic> locations) {
    lineMarkers.clear();

    locations.forEach((location) async {
      lineMarkers.add(
        Marker(
          markerId: MarkerId(location['location'].toString()),
          position: LatLng(location['location'].latitude, location['location'].longitude),
          infoWindow: InfoWindow(
            snippet: 'AAAAAA',
            title: location['line'],              
          ),
          zIndex: 100,
          icon: BitmapDescriptor.fromAsset('lib/assets/images/bus.png'),
          // icon: await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'lib/assets/images/bus.png'),
        ),
      );
    });
  }

  void addStopMarkers(List<dynamic> stops) {
    stopMarkers.clear();

    stops.forEach((stop) async {
      stopMarkers.add(
        Marker(
          markerId: MarkerId(stop['description']),
          position: LatLng(double.parse(stop['location'].split(',').first.trim()), double.parse(stop['location'].split(',').last.trim())),
          infoWindow: InfoWindow(
            snippet: 'AAAAAA',
            title: stop['description'],
          ),
          zIndex: 100,
          icon: BitmapDescriptor.fromAsset('lib/assets/images/bus-stop.png'),
          // icon: await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'lib/assets/images/bus-stop.png'),
        ),
      );
    });
  }
}
