import 'package:buscabus/screens/company/widget/company_list_view.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewDriverScreen extends StatefulWidget {
  @override
  _ViewDriverScreenState createState() => _ViewDriverScreenState();
}

class _ViewDriverScreenState extends State<ViewDriverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DefaultAppBar(
        title: Text('Motoristas'),
      ),
      body: CompanyListView(
        icon: FontAwesomeIcons.userAlt,
        itens: ['Rudinei Zilio', 'Nome Sobrenome', 'Nome Sobrenome', 'Nome Sobrenome', 'Nome Sobrenome', 'Nome Sobrenome', 'Nome Sobrenome', 'Nome Sobrenome', 'Nome Sobrenome', 'Nome Sobrenome'],
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