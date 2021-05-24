import 'package:buscabus/screens/company/widget/company_list_view.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewLineScreen extends StatefulWidget {
  @override
  _ViewLineScreenState createState() => _ViewLineScreenState();
}

class _ViewLineScreenState extends State<ViewLineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DefaultAppBar(
        title: 'Linhas',
      ),
      body: CompanyListView(
        icon: FontAwesomeIcons.projectDiagram,
        itens: ['Linha 1', 'Linha 2', 'Linha 3', 'Linha 4', 'Linha 5', 'Linha 6', 'Linha 7', 'Linha 8', 'Linha 9', 'Linha 10'],
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