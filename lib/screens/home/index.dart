import 'package:buscabus/controllers/login/login_controller.dart';
import 'package:buscabus/controllers/map/map_controller.dart';
import 'package:buscabus/controllers/theme/custom_theme_controller.dart';
import 'package:buscabus/screens/login/index.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _mapStyle;
  MapController _mapController;
  GoogleMapController _googleMapController;
  LoginController _loginController;
  BorderRadiusGeometry _radius;
  CustomThemeController _customThemeController;

  @override
  void didChangeDependencies() {
    _mapController = Provider.of<MapController>(context);
    _mapController.getPosition();
    _loginController = Provider.of<LoginController>(context);
    _customThemeController = Provider.of<CustomThemeController>(context);

    rootBundle.loadString('lib/assets/txt/map_style.txt').then((string) {
      _mapStyle = string;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
        
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DefaultAppBar(
        title: 'BuscaBus',
        automaticallyImplyLeading: false,
      ),
      endDrawer: Drawer(
        elevation: 3,
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: SvgPicture.asset('lib/assets/images/people_location.svg'),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(20),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: Column(
                  children: [
                    Observer(builder: (_) {
                      return ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.userAlt,
                          color: Colors.white,
                          size: 18,
                        ),
                        title: Text(
                          'Motorista',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          _loginController.setLoginType('driver');

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                      );
                    }),
                    Observer(builder: (_) {
                      return ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.solidBuilding,
                          color: Colors.white,
                          size: 18,
                        ),
                        title: Text(
                          'Empresa',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          _loginController.setLoginType('company');

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                      );
                    }),
                    // Observer(builder: (_) {
                    //   return ListTile(
                    //     leading: DayNightSwitcher(
                    //       isDarkModeEnabled: _customThemeController.darkMode,
                    //       onStateChanged: (value) => _customThemeController.setDarkMode(value),
                    //     ),
                    //   );
                    // }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SlidingUpPanel(         
        minHeight: 50,
        maxHeight: 450,
        parallaxEnabled: true,           
        borderRadius: _radius,
        collapsed: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: _radius,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.arrowCircleUp,
                  size: 18,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Filtrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        panelBuilder: (ScrollController sc) => lineList(sc),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
              child: Container(
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    _googleMapController = controller;
                    _googleMapController.setMapStyle(_mapStyle);
                  },
                  // onMapCreated: _onMapCreated,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(-26.2049706, -52.6990064),
                    zoom: 15.0,
                  ),
                  // markers: Set<Marker>.of(markers.values),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lineList(ScrollController sc) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: _radius,        
      ),
      child: Column(
        children: [
          Container(
            color: Colors.red,
            child: Text('AAAAAa'),
          ),
          Expanded(
            child: ListView.builder(
              controller: sc,
              itemCount: 50,
              itemBuilder: (context, index){
                return Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("$index", style: TextStyle(color: Colors.red)),
                );
              },
            ),
          ),
        ],
      ),
    );
  } 
}
