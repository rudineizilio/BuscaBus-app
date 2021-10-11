import 'package:buscabus/screens/company/create/driver.dart';
import 'package:buscabus/screens/company/widget/company_list_view.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:buscabus/controllers/company/company_controller.dart';
import 'package:provider/provider.dart';

class ViewDriverScreen extends StatefulWidget {
  @override
  _ViewDriverScreenState createState() => _ViewDriverScreenState();
}

class _ViewDriverScreenState extends State<ViewDriverScreen> {
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
        title: Text('Motoristas'),
      ),
      body: Observer(builder: (_) {
        return FutureBuilder(
          future: _companyController.company.doc('262gZboPV0OZfjQxzfko').get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('Error: ${snapshot.error}');
            }
            if (snapshot.hasData) {
              final data = snapshot.data;

              return CompanyListView(
                  icon: FontAwesomeIcons.userAlt,
                  itens: data['drivers'].map((e) => e['name']).toList());
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      }),
      floatingActionButton: Observer(builder: (_) {
        return FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateDriverScreen()),
            );
          },
        );
      }),
    );
  }
}
