import 'package:buscabus/controllers/login/login_controller.dart';
import 'package:buscabus/widgets/custom_textField.dart';
import 'package:buscabus/widgets/default_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController _loginController;

  @override
  void didChangeDependencies() {
    _loginController = Provider.of<LoginController>(context);   
    _loginController.getCompanyData(); 

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _loginController.setUser(null);
    _loginController.setPassword(null);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 50, right: 50, bottom: 0, left: 50),
                    height: 200,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Center(
                      child: SvgPicture.asset('lib/assets/images/login.svg'),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: InkWell(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      onTap: () {
                        _loginController.setLoginType('');

                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Observer(builder: (_) {
                return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(32),
                    child: !_loginController.loading
                        ? Card(
                            color: Theme.of(context).backgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Observer(builder: (_) {
                                    return CustomTextField(                                      
                                      hint: _loginController.loginType ==
                                              'company'
                                          ? 'CNPJ'
                                          : 'CPF',                                      
                                      prefix: Icon(
                                        Icons.account_circle,
                                        color: Theme.of(context).accentColor,
                                      ),
                                      textInputType: TextInputType.number,
                                      onChanged: (value) {
                                        _loginController.setUser(value);
                                      }
                                    );
                                  }),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Observer(builder: (_) {
                                    return CustomTextField(
                                      hint: 'Senha',
                                      prefix: Icon(
                                        Icons.lock,
                                        color: Theme.of(context).accentColor,
                                      ),
                                      obscure: !_loginController.passwordVisible,
                                      enabled: !_loginController.loading,
                                      onChanged: (value) {
                                        _loginController.setPassword(value);
                                      },
                                      suffix: IconButton(
                                        icon: Icon(
                                          !_loginController.passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Theme.of(context).accentColor,
                                        ),
                                        onPressed: () {
                                          _loginController
                                              .togglePasswordVisibility();
                                        },
                                      ),
                                    );
                                  }),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  SizedBox(
                                    height: 35,
                                    child: Observer(builder: (_) {
                                      return RaisedButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        child: Text('ACESSAR', style: TextStyle(fontSize: 16)),
                                        color: Theme.of(context).accentColor,
                                        disabledColor: Theme.of(context)
                                            .accentColor
                                            .withAlpha(100),
                                        textColor: Colors.white,
                                        onPressed: () {
                                          _loginController.login(context);
                                        }
                                      );
                                    }),
                                  )
                                ],
                              ),
                            ))
                        : Padding(
                            padding: const EdgeInsets.all(60),
                            child: Loading(),
                          ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
