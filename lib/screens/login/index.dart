import 'package:buscabus/controllers/login/login_controller.dart';
import 'package:buscabus/screens/company/index.dart';
import 'package:buscabus/screens/driver/index.dart';
import 'package:buscabus/widgets/custom_textField.dart';
import 'package:buscabus/widgets/default_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController _loginController;
  TextEditingController _identificationController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    _loginController = Provider.of<LoginController>(context);    
    _loginController.setMemorizeLoginData(false);

    _identificationController.text = _loginController.prefsIdentification;
    _passwordController.text = _loginController.prefsPassword;

    // autorun((_) {
    //   if (_loginController.loggedIn) {
    //     _loginController.loginType == 'company'
    //       ? Navigator.of(context).pushReplacement(
    //           MaterialPageRoute(builder: (_) => CompanyScreen())
    //         )
    //       : Navigator.of(context).pushReplacement(
    //           MaterialPageRoute(builder: (_) => DriverScreen())
    //         );
    //   }
    // });

    super.didChangeDependencies();
  }

  // @override
  // void dispose() {
  //   disposer();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 50, right: 50, bottom: 0, left: 50),
                    height: 200,
                    color: Theme.of(context).backgroundColor,
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
                            color: Theme.of(context).primaryColor,
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
                                      controller: _identificationController,
                                      hint: _loginController.loginType ==
                                              'company'
                                          ? 'CNPJ'
                                          : 'CPF',
                                      prefix: Icon(
                                        Icons.account_circle,
                                        color: Theme.of(context).accentColor,
                                      ),
                                      textInputType: TextInputType.emailAddress,
                                      onChanged:
                                          _loginController.setIdentification,
                                      enabled: !_loginController.loading,
                                    );
                                  }),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Observer(builder: (_) {
                                    return CustomTextField(
                                      controller: _passwordController,
                                      hint: 'Senha',
                                      prefix: Icon(
                                        Icons.lock,
                                        color: Theme.of(context).accentColor,
                                      ),
                                      obscure:
                                          !_loginController.passwordVisible,
                                      onChanged: _loginController.setPassword,
                                      enabled: !_loginController.loading,
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
                                    height: 44,
                                    child: Observer(builder: (_) {
                                      return RaisedButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        child: Text('ACESSAR'),
                                        color: Theme.of(context).accentColor,
                                        disabledColor: Theme.of(context)
                                            .accentColor
                                            .withAlpha(100),
                                        textColor: Colors.white,
                                        onPressed: () async {
                                          await _loginController.login();

                                          _loginController.loginType == 'company'
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => CompanyScreen()),
                                              )
                                            : Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => DriverScreen()),
                                              );
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
              Observer(builder: (_) {
                return Visibility(
                  visible: !_loginController.loading,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Memorizar meus dados',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                      ),
                      Observer(builder: (_) {
                        return Switch(
                            value: _loginController.memorizeLoginData,
                            activeColor: Theme.of(context).accentColor,
                            inactiveThumbColor: Colors.white,
                            onChanged: _loginController.setMemorizeLoginData);
                      }),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
