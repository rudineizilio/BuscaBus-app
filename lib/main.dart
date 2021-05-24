import 'package:buscabus/controllers/driver/driver_controller.dart';
import 'package:buscabus/controllers/login/login_controller.dart';
import 'package:buscabus/screens/home/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/map/map_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<MapController>(
          create: (_) => MapController(),
        ),
        Provider<LoginController>(
          create: (_) => LoginController(),
        ),
        Provider<DriverController>(
          create: (_) => DriverController(),
        ),        
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuscaBus',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color.fromRGBO(20, 20, 20, 1),
        backgroundColor: Color.fromRGBO(40, 40, 40, 1),
        accentColor: Color.fromRGBO(0, 191, 166, 1),
        scaffoldBackgroundColor: Color.fromRGBO(20, 20, 20, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        dividerColor: Color.fromRGBO(0, 191, 166, 1),
        appBarTheme: AppBarTheme(
          color: Color.fromRGBO(20, 20, 20, 1),
          elevation: 3,
          iconTheme: IconThemeData(
            color: Color.fromRGBO(0, 191, 166, 1),
          ),
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.grey[300],
              fontSize: 20
            ),
          ),
        ),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}