import 'package:buscabus/screens/company/widget/company_list_view.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewBusScreen extends StatefulWidget {
  @override
  _ViewBusScreenState createState() => _ViewBusScreenState();
}

class _ViewBusScreenState extends State<ViewBusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DefaultAppBar(
        title: 'Ônibus',
      ),
      body: CompanyListView(
        icon: FontAwesomeIcons.bus,
        itens: ['ABC - 1234', 'ABC - 0000', 'ABC - 1234', 'ABC - 0000', 'ABC - 1234', 'ABC - 0000', 'ABC - 1234', 'ABC - 0000', 'ABC - 1234', 'ABC - 0000'],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          print('Tela de cadastro');
        },
      ),      
    );
  }
}