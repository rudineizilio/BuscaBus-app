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

  List<Marker> markers = <Marker>[];

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

                    _mapController.filterType == 'lines'
                      ? addLineMarkers()
                      : addStopMarkers();

                    return GoogleMap(
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      zoomControlsEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        _googleMapController.complete(controller);
                      },
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(-26.22815111640855, -52.671710505622876),
                        zoom: 13,
                      ),
                      markers: Set<Marker>.of(markers),
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

  void addLineMarkers() {
    markers.clear();

    _locationOpenData.docs.forEach((location) async {
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

  void addStopMarkers() {
    markers.clear();

    _companyData['stops'].forEach((stop) async {
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
