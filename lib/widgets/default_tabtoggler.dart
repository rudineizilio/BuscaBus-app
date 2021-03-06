import 'package:buscabus/controllers/map/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class DefaultTabToggler extends StatefulWidget {
  final List<String> items;
  final List<dynamic> stops;
  final List<dynamic> locationsOpen;

  const DefaultTabToggler({
    @required this.items,
    this.stops,
    this.locationsOpen,
  });

  @override
  _DefaultTabTogglerState createState() => _DefaultTabTogglerState();
}

class _DefaultTabTogglerState extends State<DefaultTabToggler> {
  MapController _mapController;

  @override
  void didChangeDependencies() {
    _mapController = Provider.of<MapController>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Observer(builder: (_) {
          return GestureDetector(
            child: Container(
              width: 110,
              height: 35,
              decoration: BoxDecoration(
                color: _mapController.tabSelected == 0
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                boxShadow: kElevationToShadow[3],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Center(
                child: Text(
                  widget.items[0],
                  style: TextStyle(
                    color: _mapController.tabSelected == 0 ? Colors.white : Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            onTap: () {
              _mapController.setTabSelected(0);
              _mapController.setCameraPosition(CameraPosition(target: LatLng(-26.22815111640855, -52.671710505622876), zoom: 13));
            },
          );
        }),
        Observer(builder: (_) {
          return GestureDetector(
            child: Container(
              width: 110,
              height: 35,
              decoration: BoxDecoration(
                color: _mapController.tabSelected == 1
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                boxShadow: kElevationToShadow[3],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Center(
                child: Text(
                  widget.items[1],
                  style: TextStyle(
                    color: _mapController.tabSelected == 1 ? Colors.white : Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            onTap: () {
              _mapController.setTabSelected(1);
              _mapController.setCameraPosition(CameraPosition(target: LatLng(-26.22815111640855, -52.671710505622876), zoom: 13));
            },
          );
        }),
      ],
    );
  }
}
