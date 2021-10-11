import 'package:buscabus/controllers/company/company_controller.dart';
import 'package:buscabus/models/driver.dart';
import 'package:buscabus/screens/company/view/driver.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:buscabus/widgets/default_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateDriverScreen extends StatefulWidget {
  final Function callback;

  const CreateDriverScreen({
    @required this.callback,
  });

  @override
  _CreateBusScreenState createState() => _CreateBusScreenState();
}

class _CreateBusScreenState extends State<CreateDriverScreen> {
  CompanyController _companyController;
  Driver _driver = Driver();
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();
  MaskTextInputFormatter _cpfMasked;

  @override
  void didChangeDependencies() {
    _companyController = Provider.of<CompanyController>(context);
    _cpfMasked = MaskTextInputFormatter(mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: DefaultAppBar(
        title: Text('Novo motorista'),
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
                      hintText: 'Nome',
                      labelText: 'Nome'
                    ),
                    onChanged: (value) {
                      _driver.name = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe um Nome';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    inputFormatters: [_cpfMasked],
                    decoration: InputDecoration(
                      hintText: 'CPF',
                      labelText: 'CPF'
                    ),
                    onChanged: (_) {
                      _driver.cpf = _cpfMasked.getUnmaskedText();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe um CPF';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      labelText: 'E-mail'
                    ),
                    onChanged: (value) {
                      _driver.email = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe um E-mail';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: TextFormField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      labelText: 'Senha',
                      suffix: GestureDetector(
                        child: FaIcon(
                          _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                          color: Theme.of(context).accentColor,
                        ),
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },                        
                      ),
                    ),
                    onChanged: (value) {
                      _driver.password = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe uma Senha';
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
              await _companyController.addDriver(_driver);

              Navigator.pop(context);
              widget.callback();

              DefaultToast(
                message: 'Motorista adicionado :)',
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