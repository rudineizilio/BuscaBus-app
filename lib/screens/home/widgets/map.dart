import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../controllers/map/map_controller.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController _mapController;

  @override
  void didChangeDependencies() {
    _mapController = Provider.of<MapController>(context);
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
            child: GoogleMap(
              zoomControlsEnabled: false,
              // onMapCreated: (GoogleMapController controller) {
              //   _googleMapController = controller;
              // },
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
    );
  }  
}