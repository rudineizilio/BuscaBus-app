import 'package:buscabus/controllers/map/map_controller.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _mapStyle;
  MapController _mapController;
  GoogleMapController _googleMapController;

  @override
  void didChangeDependencies() {
    _mapController = Provider.of<MapController>(context);
    _mapController.getPosition();

    rootBundle.loadString('lib/assets/txt/map_style.txt').then((string) {
      _mapStyle = string;
    });    

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'BuscaBus',
      ),
      endDrawer: Drawer(
        elevation: 3,        
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Image.asset(
                  'lib/assets/images/people_location.png'
                ),
                // child: SvgPicture.asset(
                //   'lib/assets/images/people_location.svg'
                // ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),              
            ),
            Expanded(
              child: Container(
                color: Colors.black87,
                child: Column(
                  children: [
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.userAlt,
                        color: Colors.grey[300],
                        size: 18,
                      ),
                      title: Text(
                        'Motorista',
                        style: TextStyle(
                          color: Colors.grey[300]
                        ),
                      ),
                      onTap: () {
                        print('Tap motorista');
                      },
                    ),
                    Divider(
                      color: Theme.of(context).accentColor,
                      height: 0,
                    ),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.solidBuilding,
                        color: Colors.grey[300],
                        size: 18,
                      ),
                      title: Text(
                        'Empresa',
                        style: TextStyle(
                          color: Colors.grey[300]
                        ),                        
                      ),
                      onTap: () {
                        print('Tap empresa');
                      },                      
                    ),                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Flex(
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
          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: Center(
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Filtrar linha',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FaIcon(
                      FontAwesomeIcons.filter,
                      color: Colors.white,
                      size: 12,
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
                onPressed: () {
                  print('tap');
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}