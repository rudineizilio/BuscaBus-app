import 'package:buscabus/screens/company/index.dart';
import 'package:buscabus/screens/driver/index.dart';
import 'package:buscabus/widgets/default_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  CollectionReference company = FirebaseFirestore.instance.collection('company');

  @observable
  DocumentSnapshot companyData;

  @observable
  String user;

  @observable
  String password;

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @observable
  String loginType;

  @action
  Future<DocumentSnapshot> getCompanyData() async {
    companyData = await company.doc('262gZboPV0OZfjQxzfko').get();

    return companyData;
  }

  @action
  void setUser(String value) {
    user = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  void login(BuildContext context) {
    if (loginType == 'company') {
      if ((companyData['cnpj'] == user) && (companyData['password'] == password)) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CompanyScreen()),
        );
      } else {
        DefaultToast(
          message: 'Credenciais incorretas.',
          toastType: DefaultToastType.warning,
        ).show(context);
      }
    } else {
      companyData['drivers'].forEach((e) {
        if ((e['cpf'] == user) && (e['password'] == password)) {
          print(e);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DriverScreen(driverName: e['name'])),
          );          
        } else {
          DefaultToast(
            message: 'Credenciais incorretas.',
            toastType: DefaultToastType.warning,
          ).show(context);          
        }
      });
    }
  }

  @action
  void logout() {
    loggedIn = false;
  }

  @action
  void setLoginType(String value) {
    loginType = value;
  }
}