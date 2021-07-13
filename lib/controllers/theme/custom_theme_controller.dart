import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'custom_theme_controller.g.dart';

class CustomThemeController = _CustomThemeController with _$CustomThemeController;

abstract class _CustomThemeController with Store {
  @observable
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color.fromRGBO(20, 20, 20, 1),
    backgroundColor: Color.fromRGBO(40, 40, 40, 1),
    accentColor: Color.fromRGBO(55, 117, 178, 1),
    scaffoldBackgroundColor: Color.fromRGBO(20, 20, 20, 1),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dividerColor: Color.fromRGBO(55, 117, 178, 1),
    appBarTheme: AppBarTheme(
      color: Color.fromRGBO(20, 20, 20, 1),
      elevation: 3,
      iconTheme: IconThemeData(
        color: Color.fromRGBO(55, 117, 178, 1),
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.grey[300],
          fontSize: 20,
        ),
      ),
    ),  
  );

  @observable
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromRGBO(20, 20, 20, 1),
    backgroundColor: Colors.white,
    accentColor: Color.fromRGBO(55, 117, 178, 1),
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dividerColor: Color.fromRGBO(55, 117, 178, 1),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 3,
      iconTheme: IconThemeData(
        color: Color.fromRGBO(55, 117, 178, 1),
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.grey[300],
          fontSize: 20,
        ),
      ),
    ),
  );

  @observable
  ThemeData customTheme;
  
  @observable
  bool darkMode = false;

  @action
  void setDarkMode(bool value) {
    darkMode = value;

    setThemeData();
  }

  @action
  void setThemeData() {
    darkMode
      ? customTheme = darkTheme
      : customTheme = lightTheme;
  }
}