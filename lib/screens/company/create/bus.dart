import 'package:buscabus/controllers/company/company_controller.dart';
import 'package:buscabus/models/bus.dart';
import 'package:buscabus/screens/company/view/bus.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:buscabus/widgets/default_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateBusScreen extends StatefulWidget {
  @override
  _CreateBusScreenState createState() => _CreateBusScreenState();
}

class _CreateBusScreenState extends State<CreateBusScreen> {
  CompanyController _companyController;
  Bus _bus = Bus();

  final _formKey = GlobalKey<FormState>();
  MaskTextInputFormatter _licensePlateMasked;

  @override
  void didChangeDependencies() {
    _companyController = Provider.of<CompanyController>(context);
    _licensePlateMasked = MaskTextInputFormatter(mask: '###-####', filter: { "#": RegExp('^[a-zA-Z]{3}[0-9][A-Za-z0-9][0-9]{2}')});

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DefaultAppBar(
        title: Text('Novo ônibus'),
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
                    inputFormatters: [_licensePlateMasked],
                    decoration: InputDecoration(
                      hintText: 'Placa',
                      labelText: 'Placa'
                    ),
                    onChanged: (_) {
                      _bus.licensePlate = _licensePlateMasked.getUnmaskedText();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe uma Placa';
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
              await _companyController.addBus(_bus);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewBusScreen()),
              );

              DefaultToast(
                message: 'Ônibus adicionado :)',
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