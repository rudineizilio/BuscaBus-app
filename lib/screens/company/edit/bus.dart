import 'package:buscabus/models/bus.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:buscabus/widgets/default_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  Bus _bus = Bus();
  final _formKey = GlobalKey<FormState>();
  MaskTextInputFormatter _licensePlateMasked;

  @override
  void didChangeDependencies() {
    _licensePlateMasked = MaskTextInputFormatter(mask: '###-####', filter: { "#": RegExp('')});

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
                    onChanged: (value) {
                      _bus.licensePlate = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe uma Placa';
                      }
                      return null;
                    },
                    initialValue: widget.bus['licensePlate'].toString(),
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
              Navigator.pop(context);
              widget.callback();

              DefaultToast(
                message: 'Ônibus alterado :)',
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