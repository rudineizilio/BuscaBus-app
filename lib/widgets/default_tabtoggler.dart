import 'package:buscabus/controllers/map/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DefaultTabToggler extends StatefulWidget {
  final List<String> items;

  const DefaultTabToggler({
    @required this.items,
  });

  @override
  _DefaultTabTogglerState createState() => _DefaultTabTogglerState();
}

class _DefaultTabTogglerState extends State<DefaultTabToggler> {
  int _tabSelected = 0;
  MapController _mapController;

  @override
  void didChangeDependencies() {
    _mapController = Provider.of<MapController>(context);

    super.didChangeDependencies();
  }  

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              width: 110,
              height: 25,
              decoration: BoxDecoration(
                color: _tabSelected == 0 ? Theme.of(context).primaryColor : Colors.white,
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
                    color: _tabSelected == 0 ? Colors.white : Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                _tabSelected = 0;
                _mapController.setFilterType('lines');
              });
            },
          ),
          GestureDetector(
            child: Container(
              width: 110,
              height: 25,
              decoration: BoxDecoration(
                color: _tabSelected == 1 ? Theme.of(context).primaryColor : Colors.white,
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
                    color: _tabSelected == 1 ? Colors.white : Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                _tabSelected = 1;
                _mapController.setFilterType('points');
              });
            },          
          ),
        ],
      );
    });
  }  
}