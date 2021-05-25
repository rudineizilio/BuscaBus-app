import 'package:buscabus/screens/company/widget/company_list_view.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewStopScreen extends StatefulWidget {
  @override
  _ViewStopScreenState createState() => _ViewStopScreenState();
}

class _ViewStopScreenState extends State<ViewStopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DefaultAppBar(
        title: 'Pontos',
      ),
      body: CompanyListView(
        icon: FontAwesomeIcons.store,
        itens: ['CAPEG', 'Casa do artesão', 'UTFPR', 'Ponto 4', 'Ponto 5', 'Ponto 6', 'Ponto 7', 'Ponto 8', 'Ponto 9', 'Ponto 10'],
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