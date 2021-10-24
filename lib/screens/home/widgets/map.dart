import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../controllers/map/map_controller.dart';

class MapScreen extends StatefulWidget {
  final List<dynamic> stops;
  final List<dynamic> locationsOpen;

  const MapScreen({
    @required this.stops,
    @required this.locationsOpen,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController _mapController;
  Completer<GoogleMapController> _googleMapController = Completer();

  @override
  void didChangeDependencies() async {
    _mapController = Provider.of<MapController>(context);
    _mapController.getPosition();

    _mapController.addMarkers(widget.stops, widget.locationsOpen);

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
                markers: Set<Marker>.of(_mapController.markers),
              );
            }),
          ),
        ),
      ],
    );
  }
}
