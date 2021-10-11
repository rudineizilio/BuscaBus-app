// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  final _$companyAtom = Atom(name: '_LoginController.company');

  @override
  CollectionReference get company {
    _$companyAtom.reportRead();
    return super.company;
  }

  @override
  set company(CollectionReference value) {
    _$companyAtom.reportWrite(value, super.company, () {
      super.company = value;
    });
  }

  final _$companyDataAtom = Atom(name: '_LoginController.companyData');

  @override
  DocumentSnapshot get companyData {
    _$companyDataAtom.reportRead();
    return super.companyData;
  }

  @override
  set companyData(DocumentSnapshot value) {
    _$companyDataAtom.reportWrite(value, super.companyData, () {
      super.companyData = value;
    });
  }

  final _$userAtom = Atom(name: '_LoginController.user');

  @override
  String get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginController.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$passwordVisibleAtom = Atom(name: '_LoginController.passwordVisible');

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginController.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loggedInAtom = Atom(name: '_LoginController.loggedIn');

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  final _$loginTypeAtom = Atom(name: '_LoginController.loginType');

  @override
  String get loginType {
    _$loginTypeAtom.reportRead();
    return super.loginType;
  }

  @override
  set loginType(String value) {
    _$loginTypeAtom.reportWrite(value, super.loginType, () {
      super.loginType = value;
    });
  }

  final _$getCompanyDataAsyncAction =
      AsyncAction('_LoginController.getCompanyData');

  @override
  Future<DocumentSnapshot> getCompanyData() {
    return _$getCompanyDataAsyncAction.run(() => super.getCompanyData());
  }

  final _$_LoginControllerActionController =
      ActionController(name: '_LoginController');

  @override
  void setUser(String value) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void login(BuildContext context) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.login');
    try {
      return super.login(context);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.logout');
    try {
      return super.logout();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoginType(String value) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setLoginType');
    try {
      return super.setLoginType(value);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
company: ${company},
companyData: ${companyData},
user: ${user},
password: ${password},
passwordVisible: ${passwordVisible},
loading: ${loading},
loggedIn: ${loggedIn},
loginType: ${loginType}
    ''';
  }
}
