// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  Computed<bool> _$isIdentificationIsValidComputed;

  @override
  bool get isIdentificationIsValid => (_$isIdentificationIsValidComputed ??=
          Computed<bool>(() => super.isIdentificationIsValid,
              name: '_LoginController.isIdentificationIsValid'))
      .value;
  Computed<bool> _$isPasswordIsValidComputed;

  @override
  bool get isPasswordIsValid => (_$isPasswordIsValidComputed ??= Computed<bool>(
          () => super.isPasswordIsValid,
          name: '_LoginController.isPasswordIsValid'))
      .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_LoginController.isFormValid'))
          .value;
  Computed<Function> _$loginPressedComputed;

  @override
  Function get loginPressed =>
      (_$loginPressedComputed ??= Computed<Function>(() => super.loginPressed,
              name: '_LoginController.loginPressed'))
          .value;

  final _$prefsAtom = Atom(name: '_LoginController.prefs');

  @override
  SharedPreferences get prefs {
    _$prefsAtom.reportRead();
    return super.prefs;
  }

  @override
  set prefs(SharedPreferences value) {
    _$prefsAtom.reportWrite(value, super.prefs, () {
      super.prefs = value;
    });
  }

  final _$identificationAtom = Atom(name: '_LoginController.identification');

  @override
  String get identification {
    _$identificationAtom.reportRead();
    return super.identification;
  }

  @override
  set identification(String value) {
    _$identificationAtom.reportWrite(value, super.identification, () {
      super.identification = value;
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

  final _$memorizeLoginDataAtom =
      Atom(name: '_LoginController.memorizeLoginData');

  @override
  bool get memorizeLoginData {
    _$memorizeLoginDataAtom.reportRead();
    return super.memorizeLoginData;
  }

  @override
  set memorizeLoginData(bool value) {
    _$memorizeLoginDataAtom.reportWrite(value, super.memorizeLoginData, () {
      super.memorizeLoginData = value;
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

  final _$prefsIdentificationAtom =
      Atom(name: '_LoginController.prefsIdentification');

  @override
  String get prefsIdentification {
    _$prefsIdentificationAtom.reportRead();
    return super.prefsIdentification;
  }

  @override
  set prefsIdentification(String value) {
    _$prefsIdentificationAtom.reportWrite(value, super.prefsIdentification, () {
      super.prefsIdentification = value;
    });
  }

  final _$prefsPasswordAtom = Atom(name: '_LoginController.prefsPassword');

  @override
  String get prefsPassword {
    _$prefsPasswordAtom.reportRead();
    return super.prefsPassword;
  }

  @override
  set prefsPassword(String value) {
    _$prefsPasswordAtom.reportWrite(value, super.prefsPassword, () {
      super.prefsPassword = value;
    });
  }

  final _$getPrefsAsyncAction = AsyncAction('_LoginController.getPrefs');

  @override
  Future<void> getPrefs() {
    return _$getPrefsAsyncAction.run(() => super.getPrefs());
  }

  final _$loginAsyncAction = AsyncAction('_LoginController.login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_LoginControllerActionController =
      ActionController(name: '_LoginController');

  @override
  void setIdentification(String value) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setIdentification');
    try {
      return super.setIdentification(value);
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
  void setMemorizeLoginData(bool value) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setMemorizeLoginData');
    try {
      return super.setMemorizeLoginData(value);
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
prefs: ${prefs},
identification: ${identification},
password: ${password},
passwordVisible: ${passwordVisible},
loading: ${loading},
loggedIn: ${loggedIn},
memorizeLoginData: ${memorizeLoginData},
loginType: ${loginType},
prefsIdentification: ${prefsIdentification},
prefsPassword: ${prefsPassword},
isIdentificationIsValid: ${isIdentificationIsValid},
isPasswordIsValid: ${isPasswordIsValid},
isFormValid: ${isFormValid},
loginPressed: ${loginPressed}
    ''';
  }
}
