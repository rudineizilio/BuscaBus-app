import 'package:buscabus/controllers/company/company_controller.dart';
import 'package:buscabus/screens/company/widget/company_list_view.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:buscabus/screens/company/create/stop.dart';

class ViewStopScreen extends StatefulWidget {
  @override
  _ViewStopScreenState createState() => _ViewStopScreenState();
}

class _ViewStopScreenState extends State<ViewStopScreen> {
  CompanyController _companyController;

  @override
  void didChangeDependencies() {
    _companyController = Provider.of<CompanyController>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DefaultAppBar(
        title: Text('Pontos'),
      ),
      body: FutureBuilder(
        future: _companyController.company.doc('262gZboPV0OZfjQxzfko').get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            final data = snapshot.data;
        
            return CompanyListView(
              icon: FontAwesomeIcons.store,
              itens: data['stops'].map((e) => e).toList(),
              type: 'Ponto',
              callback: callback,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateStopScreen(callback: callback)),
          );
        },
      ),
    );
  }

  void callback() {
    setState(() {});
  }  
}