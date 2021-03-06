import 'package:buscabus/models/driver.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:buscabus/widgets/default_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditDriverScreen extends StatefulWidget {
  final Function callback;
  final dynamic driver;

  const EditDriverScreen({
    @required this.callback,
    @required this.driver,
  });

  @override
  _CreateBusScreenState createState() => _CreateBusScreenState();
}

class _CreateBusScreenState extends State<EditDriverScreen> {
  Driver _driver = Driver();
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();
  MaskTextInputFormatter _cpfMasked;

  @override
  void didChangeDependencies() {
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
                    keyboardType: TextInputType.name,
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
                    initialValue: widget.driver['name'].toString(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
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
                    initialValue: widget.driver['cpf'].toString(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                    initialValue: widget.driver['email'].toString(),
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
                    initialValue: widget.driver['password'].toString(),
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
                message: 'Motorista alterado :)',
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