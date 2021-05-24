import 'package:buscabus/controllers/login/login_controller.dart';
import 'package:buscabus/controllers/map/map_controller.dart';
import 'package:buscabus/screens/login/index.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  LoginController _loginController;

  @override
  void didChangeDependencies() {
    _mapController = Provider.of<MapController>(context);
    _mapController.getPosition();
    _loginController = Provider.of<LoginController>(context);
    getData();

    rootBundle.loadString('lib/assets/txt/map_style.txt').then((string) {
      _mapStyle = string;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
                child:
                    SvgPicture.asset('lib/assets/images/people_location.svg'),
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
                          _loginController.getPrefs();

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
                          _loginController.getPrefs();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                      );
                    }),
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
                    showFilterDialog(context);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  void showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Theme.of(context).backgroundColor,
        contentPadding: const EdgeInsets.all(0),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selecione uma linha:',
              style:
                  TextStyle(color: Theme.of(context).accentColor, fontSize: 15),
            ),
            Divider(),
          ],
        ),
        content: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return RadioListTile(
              activeColor: Theme.of(context).accentColor,
              title: Text(
                'Item $index',
                style: TextStyle(fontSize: 15),
              ),
              groupValue: 1,
              value: 1,
              onChanged: (value) {
                print(value);
              },
            );
          },
        ),
        actions: [
          FlatButton(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.check,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            onPressed: () {
              print('save filter');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<DocumentSnapshot> getData() async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance
        .collection("driver").get().then((value) {
          value.docChanges.forEach((element) {print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${element.doc.data()}');});
        });
        // get().then((value) {
        //   value.docs.forEach((element) { print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${element.data}'); });
        // });
  }  
}
