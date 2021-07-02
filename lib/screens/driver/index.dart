import 'package:buscabus/controllers/driver/driver_controller.dart';
import 'package:buscabus/controllers/login/login_controller.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DriverScreen extends StatefulWidget {
  @override
  _DriverScreenState createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  LoginController _loginController;
  DriverController _driverController;

  @override
  void didChangeDependencies() {
    _loginController = Provider.of<LoginController>(context);
    _driverController = Provider.of<DriverController>(context);
    _driverController.setBus(null);
    _driverController.setLine(null);


    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DefaultAppBar(
        title: 'Motorista',
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              tooltip: 'Sair',
              icon: FaIcon(
                FontAwesomeIcons.signOutAlt,
                color: Theme.of(context).accentColor,
                size: 20,
              ),
              onPressed: () {
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
              Observer(builder: (_) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(70),
                    image: DecorationImage(
                      image: AssetImage(
                        !_driverController.sharedLocation
                          ? 'lib/assets/images/static_bus.jpg'
                          : 'lib/assets/images/bus.gif',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }),
              Observer(builder: (_) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: DropdownButton(
                    hint: Text(_driverController.busSelected == null
                        ? 'Selecione um ônibus'
                        : _driverController.busSelected),
                    items: ['Ônibus 1', 'Ônibus 2', 'Ônibus 3'].map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    isExpanded: true,
                    iconSize: 30,
                    onChanged: (value) {
                      _driverController.setBus(value);
                    },
                    dropdownColor: Theme.of(context).accentColor,
                  ),
                );
              }),
              Observer(builder: (_) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: DropdownButton(
                    hint: Text(_driverController.lineSelected == null
                        ? 'Selecione uma linha'
                        : _driverController.lineSelected),
                    items: ['Linha 1', 'Linha 2', 'Linha 3'].map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    isExpanded: true,
                    iconSize: 30,
                    onChanged: _driverController.busSelected != null
                        ? (value) {
                            _driverController.setLine(value);
                          }
                        : null,
                    dropdownColor: Theme.of(context).accentColor,
                  ),
                );
              }),
              SizedBox(
                height: 10,
              ),
              Observer(builder: (_) {
                return RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    width: 200,
                    child: Center(
                      child: Text(!_driverController.sharedLocation /*&& _driverController.serviceEnabled*/
                          ? 'INICIAR COMPARTILHAMENTO'
                          : 'PARAR COMPARTILHAMENTO'),
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                  disabledColor: Theme.of(context).accentColor.withAlpha(100),
                  textColor: Colors.white,
                  onPressed: (_driverController.sharedButtonEnabled /*&& _driverController.serviceEnabled)*/)
                      ? () {
                          _driverController.setCharedLocation();
                          _driverController.locationInTime;
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
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: DataTable(
                  columnSpacing: 20,
                  horizontalMargin: 10,
                  headingRowHeight: 30,
                  dividerThickness: 0.001,
                  headingTextStyle: const TextStyle(
                    fontSize: 13,
                  ),
                  headingRowColor: MaterialStateProperty.resolveWith(
                    (states) => Theme.of(context).accentColor,
                  ),
                  columns: [
                    DataColumn(label: Text('Descrição')),
                    DataColumn(label: Text('Início')),
                    DataColumn(label: Text('Fim')),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(Text('Exemplo')),
                        DataCell(Text('23/05/2021 - 10:00')),
                        DataCell(Text('23/05/2021 - 14:20')),
                      ],
                    ),
                  ],
                  dataRowHeight: 30,
                  dataTextStyle: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }  
}
