import 'dart:ui';
import 'package:buscabus/controllers/company/company_controller.dart';
import 'package:buscabus/controllers/location_open/location_open_controller.dart';
import 'package:buscabus/controllers/map/map_controller.dart';
import 'package:buscabus/widgets/defaul_modalbottomsheet.dart';
import 'package:buscabus/widgets/default_tabtoggler.dart';
import 'package:flutter/material.dart';
import 'package:buscabus/screens/home/widgets/map.dart';
import 'package:buscabus/screens/home/widgets/menu.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../widgets/default_appBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MapController _mapController;
  CompanyController _companyController;
  LocationOpenController _locationOpenController;

  dynamic _companyData;
  dynamic _locationOpenData;

  @override
  void didChangeDependencies() {
    _mapController = Provider.of<MapController>(context);
    _companyController = Provider.of<CompanyController>(context);
    _locationOpenController = Provider.of<LocationOpenController>(context);

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
                    MapScreen(),
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
              return CircularProgressIndicator();
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
                        _mapController.setCameraPosition(CameraPosition(target: LatLng(e['location'].latitude, e['location'].longitude), zoom: 14.5));
                        Navigator.pop(context);
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
                        _mapController.setCameraPosition(CameraPosition(target: LatLng(e['location'].latitude, e['location'].longitude), zoom: 14.5));
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
          ).show(context);
        },
      ),
    );
  } 
}
