import 'package:buscabus/controllers/company/company_controller.dart';
import 'package:buscabus/models/stop.dart';
import 'package:buscabus/screens/company/view/stop.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:buscabus/widgets/default_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CreateStopScreen extends StatefulWidget {
  @override
  _CreateBusScreenState createState() => _CreateBusScreenState();
}

class _CreateBusScreenState extends State<CreateStopScreen> {
  CompanyController _companyController;
  Stop _stop = Stop();

  final _formKey = GlobalKey<FormState>();

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
        title: Text('Novo ponto'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,              
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Descrição',
                      labelText: 'Descrição'
                    ),
                    onChanged: (value) {
                      _stop.description = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe uma Descrição';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Coordenadas',
                      labelText: 'Coordenadas'
                    ),
                    onChanged: (value) {
                      _stop.location = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe as Coordenadas';
                      }
                      return null;
                    },
                  ),
                ),                
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Observer(builder: (_) {
        return ElevatedButton(
          child: Text('Salvar'),
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              await _companyController.addStop(_stop);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewStopScreen()),
              );

              DefaultToast(
                message: 'Ponto adicionado :)',
                toastType: DefaultToastType.success,
              ).show(context);
            } else {
              DefaultToast(
                message: 'Ops, algo deu errado :(',
                toastType: DefaultToastType.danger,
              ).show(context);
            }
          },
        );
      }),
    );
  }
}