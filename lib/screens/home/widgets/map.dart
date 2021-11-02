import 'dart:async';

import 'package:buscabus/controllers/company/company_controller.dart';
import 'package:buscabus/controllers/location_open/location_open_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

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

  Stream<DocumentSnapshot> _stopsStream;
  Stream<QuerySnapshot> _linesStream;

  List<Marker> lineMarkers = <Marker>[];
  List<Marker> stopMarkers = <Marker>[];

  dynamic _companyData;
  dynamic _locationOpenData;  

  @override
  void didChangeDependencies() async {
    _mapController = Provider.of<MapController>(context);
    _companyController = Provider.of<CompanyController>(context);
    _locationOpenController = Provider.of<LocationOpenController>(context);

    _stopsStream = _companyController.company.doc('262gZboPV0OZfjQxzfko').snapshots();
    _linesStream = _locationOpenController.locationOpen.snapshots();

    _mapController.setTabSelected(0);
    _mapController.getPosition();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());
    
    return Observer(builder: (_) {
      return Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            child: Container(    
              child: _mapController.filterSelected == 'stops'
                ? StreamBuilder<DocumentSnapshot>(
                    stream: _stopsStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print('Error: ${snapshot.error}');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData) {
                        _companyData = snapshot.data;
                        addStopMarkers(_companyData['stops']);

                        return map();                        
                      }
                      return Center(child: CircularProgressIndicator());                     
                    }, 
                  )
                : StreamBuilder<QuerySnapshot>(
                    stream: _linesStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print('Error: ${snapshot.error}');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData) {
                        _locationOpenData = snapshot.data; 
                        addLineMarkers(_locationOpenData.docs);

                        return map();                        
                      }
                      return Center(child: CircularProgressIndicator());                     
                    }, 
                  ),
                // ? FutureBuilder(
                //     future: _companyController.company.doc('262gZboPV0OZfjQxzfko').get(),
                //     builder: (context, snapshot) {
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return Center(child: CircularProgressIndicator());
                //       }
                //       if (snapshot.hasError) {
                //         print('Error: ${snapshot.error}');
                //       }
                //       if (snapshot.hasData) {
                //         _companyData = snapshot.data;
                //         addStopMarkers(_companyData['stops']);

                //         return map();
                //       }
                //       return Center(child: CircularProgressIndicator());
                //     },
                //   )
                // : FutureBuilder(
                //     future: _locationOpenController.locationOpen.get(),
                //     builder: (context, snapshot) {
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return Center(child: CircularProgressIndicator());
                //       }
                //       if (snapshot.hasError) {
                //         print('Error: ${snapshot.error}');
                //       }
                //       if (snapshot.hasData) {
                //         _locationOpenData = snapshot.data; 
                //         addLineMarkers(_locationOpenData.docs);

                //         return map();
                //       }
                //       return Center(child: CircularProgressIndicator());
                //     },
                //   ),
            ),
          ),
        ],
      );
    }); 
  }

  Widget map() {
    return GoogleMap(
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      zoomControlsEnabled: false,  
      mapToolbarEnabled: _mapController.filterSelected == 'lines'
        ? false
        : true,                  
      onMapCreated: (GoogleMapController controller) {
        if (!_googleMapController.isCompleted) {
          _googleMapController.complete(controller);
        }
      },
      initialCameraPosition: const CameraPosition(
        target: LatLng(-26.22815111640855, -52.671710505622876),
        zoom: 13,
      ),
      markers: _mapController.filterSelected == 'lines'
        ? Set<Marker>.of(lineMarkers)
        : Set<Marker>.of(stopMarkers),
    );    
  }

  void addLineMarkers(List<dynamic> locations) {
    lineMarkers.clear();

    locations.forEach((location) async {
      String lastUpdate = timeago.format(location['lastUpdate'].toDate(), locale: 'pt_BR').toLowerCase();

      lineMarkers.add(
        Marker(
          markerId: MarkerId(location['location'].toString()),
          position: LatLng(location['location'].latitude, location['location'].longitude),
          infoWindow: InfoWindow(
            title: location['line'],
            snippet: 'Atualizado $lastUpdate',
          ),
          zIndex: 100,
          icon: BitmapDescriptor.fromAsset('lib/assets/images/bus.png'),
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
            title: stop['description'],
          ),
          zIndex: 100,
          icon: BitmapDescriptor.fromAsset('lib/assets/images/bus-stop.png'),
        ),
      );
    });
  }
}
