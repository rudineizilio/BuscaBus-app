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
    _driverController.listenPosition();
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
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: DropdownButton(
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                      underline: SizedBox(),
                      hint: Text(_driverController.busSelected == null
                          ? 'Selecione um ônibus'
                          : _driverController.busSelected
                      ),
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
                      dropdownColor: Colors.white,
                    ),
                  ),
                );
              }),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(  
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5)
                    ),                    
                    child: DropdownButton(
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                      underline: SizedBox(),
                      hint: Text(_driverController.lineSelected == null
                          ? 'Selecione uma linha'
                          : _driverController.lineSelected,
                        style: TextStyle(
                          color: _driverController.busSelected != null
                            ? Colors.grey[700]
                            : Colors.grey,
                        ),
                      ),
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
                      dropdownColor: Colors.white,
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 30,
              ),
              Observer(builder: (_) {
                return RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    width: 150,
                    child: Center(
                      child: Text(
                        !_driverController.sharedLocation
                          ? 'Iniciar'
                          : 'Parar'),
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                  disabledColor: Theme.of(context).accentColor.withAlpha(100),
                  textColor: Colors.white,
                  onPressed: _driverController.sharedButtonEnabled
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
                    color: Colors.black54,
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
