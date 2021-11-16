import 'package:buscabus/controllers/company/company_controller.dart';
import 'package:buscabus/controllers/driver/driver_controller.dart';
import 'package:buscabus/controllers/login/login_controller.dart';
import 'package:buscabus/models/location_close.dart';
import 'package:buscabus/models/location_open.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DriverScreen extends StatefulWidget {
  final String driverName;

  const DriverScreen({
    @required this.driverName,
  });

  @override
  _DriverScreenState createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  LoginController _loginController;
  DriverController _driverController;
  CompanyController _companyController;

  @override
  void didChangeDependencies() {
    _loginController = Provider.of<LoginController>(context);
    _driverController = Provider.of<DriverController>(context);
    _companyController = Provider.of<CompanyController>(context);
    _driverController.listenPosition();
    _driverController.getPosition();
    _driverController.setBus(null);
    _driverController.setLine(null);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _driverController.positionStream.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: DefaultAppBar(
        title: Text('Motorista'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              tooltip: 'Sair',
              icon: FaIcon(
                FontAwesomeIcons.signOutAlt,
                size: 20,
              ),
              onPressed: () {
                _driverController.setBus(null);
                _driverController.setLine(null);
                _loginController.setLoginType('driver');
                _loginController.logout();

                Navigator.pop(context);
              }),
        ],
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: FutureBuilder(
                    future: _companyController.company.doc('262gZboPV0OZfjQxzfko').get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print('Error: ${snapshot.error}');
                      }
                      if (snapshot.hasData) {
                        final data = snapshot.data['bus'];

                        return Observer(builder: (_) {
                          return DropdownButton<dynamic>(
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                            underline: SizedBox(),
                            hint: Text(
                              _driverController.busSelected == null
                                  ? 'Selecione um ônibus'
                                  : _driverController.busSelected,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,
                              ),
                            ),
                            items: data.map<DropdownMenuItem<dynamic>>((e) {
                              return DropdownMenuItem(
                                value: e['licensePlate'],
                                child: Text(e['licensePlate']),
                              );
                            }).toList(),
                            isExpanded: true,
                            iconSize: 30,
                            onChanged: (value) => _driverController.setBus(value),
                            dropdownColor: Colors.white,
                          );
                        });
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),              
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: FutureBuilder(
                    future: _companyController.company.doc('262gZboPV0OZfjQxzfko').get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print('Error: ${snapshot.error}');
                      }
                      if (snapshot.hasData) {
                        final data = snapshot.data['lines'];

                        return Observer(builder: (_) {
                          return DropdownButton<dynamic>(
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                            underline: SizedBox(),
                            hint: Text(
                              _driverController.lineSelected == null
                                  ? 'Selecione uma linha'
                                  : _driverController.lineSelected,
                              style: TextStyle(
                                color: _driverController.busSelected != null
                                    ? Colors.grey[700]
                                    : Colors.grey,
                                  fontSize: 16,
                              ),
                            ),
                            items: data.map<DropdownMenuItem<dynamic>>((e) {
                              return DropdownMenuItem(
                                value: e['title'],
                                child: Text(e['title']),
                              );
                            }).toList(),
                            isExpanded: true,
                            iconSize: 30,
                            onChanged: _driverController.busSelected != null
                                ? (value) {
                                    _driverController.setLine(value);
                                  }
                                : null,
                            dropdownColor: Colors.white,
                          );
                        });
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Observer(builder: (_) {
                return RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    width: 150,
                    child: Center(
                      child: Text(
                        _driverController.sharedLocation
                          ? 'Parar'
                          : 'Iniciar',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                  disabledColor: Theme.of(context).accentColor.withAlpha(100),
                  textColor: Colors.white,
                  onPressed: _driverController.sharedButtonEnabled
                    ? !_driverController.sharedLocation 
                      ? () {
                          _driverController.setSharedLocation(true);

                          _driverController.openDriverLocation(
                            LocationOpen(
                              bus: _driverController.busSelected,
                              line: _driverController.lineSelected,
                              driver: widget.driverName,
                              startDate: DateTime.now(),
                              location: GeoPoint(_driverController.driverPosition.latitude, _driverController.driverPosition.longitude),
                              lastUpdate: DateTime.now(),
                            ),
                          );
                        }
                      : () {
                          _driverController.setSharedLocation(false);

                          _driverController.deleteDriverLocation(
                            LocationClose(
                              bus: _driverController.currentLocation.bus,
                              line: _driverController.currentLocation.line,
                              driver: _driverController.currentLocation.driver,
                              startDate: _driverController.currentLocation.startDate,
                              lastUpdate: _driverController.currentLocation.lastUpdate,
                              endDate: DateTime.now(),
                            ),
                          );

                          _driverController.cancelTimer();

                          setState(() {_driverController.locationClose.get();});
                        }
                    : null,
                );
              }),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: _driverController.locationClose.get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('Error: ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  QuerySnapshot snap = snapshot.data;
                  List<dynamic> snaps = [];

                  snap.docs.forEach((e) {
                    if (e.data().containsValue(widget.driverName)) {
                      snaps.add(e);
                    }
                  });

                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 5,
                        color: Theme.of(context).accentColor,
                        indent: 70,
                      );
                    },
                    itemCount: snaps.length,
                    itemBuilder: (context, index) {
                      final dynamic item = snaps[index];

                      return Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Theme.of(context).accentColor,
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.busAlt,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                          title: Text(item.get('line')),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Início: ${DateFormat('dd/MM/yyyy - HH:mm').format(item.get('startDate').toDate()).toString()}'),
                              Text('Fim: ${DateFormat('dd/MM/yyyy - HH:mm').format(item.get('endDate').toDate()).toString()}'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },   
            ),            
          ),
        ],
      ),
    );
  }
}
