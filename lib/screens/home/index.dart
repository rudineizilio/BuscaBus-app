import 'package:buscabus/controllers/map/map_controller.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MapController _mapController;

  @override
  void didChangeDependencies() {
    _mapController = Provider.of<MapController>(context);
    _mapController.getPosition();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'BuscaBus',
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Text('TELA DE TESTE'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MaterialApp()),
                  );                  
                },
              ),
            ],
          ),
          Flexible(
            child: Container(
              child: GoogleMap(
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
    );
  }
}