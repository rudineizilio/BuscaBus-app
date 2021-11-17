import 'package:buscabus/controllers/company/company_controller.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:buscabus/widgets/default_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditBusScreen extends StatefulWidget {
  final Function callback;
  final dynamic bus;

  const EditBusScreen({
   @required this.callback,
   @required this.bus,
  });

  @override
  _EditBusScreenState createState() => _EditBusScreenState();
}

class _EditBusScreenState extends State<EditBusScreen> {
  CompanyController _companyController;

  final _formKey = GlobalKey<FormState>();
  MaskTextInputFormatter _licensePlateMasked;
  TextEditingController _textEditingController;

  @override
  void didChangeDependencies() {
    _companyController = Provider.of<CompanyController>(context);
    _licensePlateMasked = MaskTextInputFormatter(mask: '###-####', filter: { "#": RegExp('')});
    _textEditingController = TextEditingController(text: widget.bus['licensePlate']);

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
                    controller: _textEditingController,
                    // inputFormatters: [_licensePlateMasked],
                    decoration: InputDecoration(
                      hintText: 'Placa',
                      labelText: 'Placa'
                    ),                      
                    onChanged: (value) {
                      _textEditingController.text = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe uma Placa';
                      }
                      return null;
                    },
                    // initialValue: widget.bus['licensePlate'].toString(),
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
              // await _companyController.editBus(widget.bus);
              
              Navigator.pop(context);
              widget.callback();

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