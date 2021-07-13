// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_theme_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomThemeController on _CustomThemeController, Store {
  final _$darkThemeAtom = Atom(name: '_CustomThemeController.darkTheme');

  @override
  ThemeData get darkTheme {
    _$darkThemeAtom.reportRead();
    return super.darkTheme;
  }

  @override
  set darkTheme(ThemeData value) {
    _$darkThemeAtom.reportWrite(value, super.darkTheme, () {
      super.darkTheme = value;
    });
  }

  final _$lightThemeAtom = Atom(name: '_CustomThemeController.lightTheme');

  @override
  ThemeData get lightTheme {
    _$lightThemeAtom.reportRead();
    return super.lightTheme;
  }

  @override
  set lightTheme(ThemeData value) {
    _$lightThemeAtom.reportWrite(value, super.lightTheme, () {
      super.lightTheme = value;
    });
  }

  final _$customThemeAtom = Atom(name: '_CustomThemeController.customTheme');

  @override
  ThemeData get customTheme {
    _$customThemeAtom.reportRead();
    return super.customTheme;
  }

  @override
  set customTheme(ThemeData value) {
    _$customThemeAtom.reportWrite(value, super.customTheme, () {
      super.customTheme = value;
    });
  }

  final _$darkModeAtom = Atom(name: '_CustomThemeController.darkMode');

  @override
  bool get darkMode {
    _$darkModeAtom.reportRead();
    return super.darkMode;
  }

  @override
  set darkMode(bool value) {
    _$darkModeAtom.reportWrite(value, super.darkMode, () {
      super.darkMode = value;
    });
  }

  final _$_CustomThemeControllerActionController =
      ActionController(name: '_CustomThemeController');

  @override
  void setDarkMode(bool value) {
    final _$actionInfo = _$_CustomThemeControllerActionController.startAction(
        name: '_CustomThemeController.setDarkMode');
    try {
      return super.setDarkMode(value);
    } finally {
      _$_CustomThemeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setThemeData() {
    final _$actionInfo = _$_CustomThemeControllerActionController.startAction(
        name: '_CustomThemeController.setThemeData');
    try {
      return super.setThemeData();
    } finally {
      _$_CustomThemeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
darkTheme: ${darkTheme},
lightTheme: ${lightTheme},
customTheme: ${customTheme},
darkMode: ${darkMode}
    ''';
  }
}
