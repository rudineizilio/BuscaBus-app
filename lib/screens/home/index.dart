import 'dart:async';
import 'dart:ui';
import 'package:buscabus/controllers/company/company_controller.dart';
import 'package:buscabus/controllers/location_open/location_open_controller.dart';
import 'package:buscabus/controllers/map/map_controller.dart';
import 'package:buscabus/widgets/defaul_modalbottomsheet.dart';
import 'package:buscabus/widgets/default_tabtoggler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:buscabus/screens/home/widgets/menu.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../widgets/default_appBar.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MapController _mapController;
  CompanyController _companyController;
  LocationOpenController _locationOpenController;
  Completer<GoogleMapController> _googleMapController = Completer();

  Stream<DocumentSnapshot> _stopsStream;
  Stream<QuerySnapshot> _linesStream;

  List<Marker> lineMarkers = <Marker>[];
  List<Marker> stopMarkers = <Marker>[];

  dynamic _companyData;
  dynamic _locationOpenData;

  @override
  void didChangeDependencies() {
    _mapController = Provider.of<MapController>(context);
    _companyController = Provider.of<CompanyController>(context);
    _locationOpenController = Provider.of<LocationOpenController>(context);

    _mapController.setCameraPosition(CameraPosition(target: LatLng(-26.22815111640855, -52.671710505622876), zoom: 13));

    _stopsStream = getStops();
    _linesStream = getLines();

    _mapController.setTabSelected(0);
    _mapController.getPosition();    

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: DefaultAppBar(
        title: Container(
            width: 90, child: Image.asset('lib/assets/images/logo.png')),
        automaticallyImplyLeading: false,
      ),
      body: Observer(builder: (_) {
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

                return Stack(
                  children: [
                    mapScreen(),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 30,
                      child: DefaultTabToggler(
                        items: ['Linhas', 'Pontos'],
                        stops: _companyData['stops'],
                        locationsOpen: _locationOpenData.docs,
                      ),
                    ),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator());
            });
      }),
      endDrawer: Drawer(child: MenuScreen()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).accentColor,
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.filter_alt_rounded,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Filtrar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ]),
        ),
        onTap: () {          
          DefaultModalBottomSheet(
            title: _mapController.filterSelected == 'lines'
                ? 'Filtrar Linhas'
                : 'Filtrar Pontos',
            items: _mapController.filterSelected == 'lines'
                ? _locationOpenData.docs.map((e) {
                    return ItemModalBottomSheet(
                      icon: FontAwesomeIcons.projectDiagram,
                      body: Container(
                        child: Text(e['line'], style: TextStyle(fontSize: 16)),
                      ),
                      onTap: () {
                        setState(() {                          
                          _mapController.setCameraPosition(CameraPosition(target: LatLng(e['location'].latitude, e['location'].longitude), zoom: 14.5));
                          Navigator.pop(context);
                        });
                      },
                    );
                  }).toList()
                : _companyData['stops'].map((e) {
                    return ItemModalBottomSheet(
                      icon: FontAwesomeIcons.store,
                      body: Container(
                        child: Text(e['description'], style: TextStyle(fontSize: 16)),
                      ),
                      onTap: () {
                        setState(() {                          
                          _mapController.setCameraPosition(CameraPosition(target: LatLng(e['location'].latitude, e['location'].longitude), zoom: 14.5));
                          Navigator.pop(context);
                        });
                      },
                    );
                  }).toList(),
          ).show(context);
        },
      ),
    );
  }

  Widget mapScreen() {
    timeago.setLocaleMessages('pt_BR', timeago.PtBrMessages());
    return Observer(builder: (_) {
      return Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            child: Container(    
              child: _mapController.filterSelected == 'stops'
                ? StreamBuilder<DocumentSnapshot>(
                    stream: getStops(),
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
                    stream: getLines(),
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
      initialCameraPosition: _mapController.cameraPosition,
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
          onTap: () {
            _mapController.setCameraPosition(CameraPosition(target: LatLng(location['location'].latitude, location['location'].longitude), zoom: 14.5));
          }
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
          position: LatLng(stop['location'].latitude, stop['location'].longitude),
          infoWindow: InfoWindow(
            title: stop['description'],
          ),
          zIndex: 100,
          icon: BitmapDescriptor.fromAsset('lib/assets/images/bus-stop.png'),
          onTap: () {
            _mapController.setCameraPosition(CameraPosition(target: LatLng(stop['location'].latitude, stop['location'].longitude), zoom: 14.5));
          }          
        ),
      );
    });
  }

  Stream<DocumentSnapshot> getStops() {
    return _companyController.company.doc('262gZboPV0OZfjQxzfko').snapshots();
  }

  Stream<QuerySnapshot> getLines() {
    return _locationOpenController.locationOpen.snapshots();
  }
}
