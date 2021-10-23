import 'package:buscabus/controllers/driver/driver_controller.dart';
import 'package:buscabus/controllers/company/company_controller.dart';
import 'package:buscabus/controllers/location_close/location_close_controller.dart';
import 'package:buscabus/controllers/location_open/location_open_controller.dart';
import 'package:buscabus/controllers/login/login_controller.dart';
import 'package:buscabus/screens/home/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'controllers/map/map_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        Provider<CompanyController>(
          create: (_) => CompanyController(),
        ),
        Provider<LocationOpenController>(
          create: (_) => LocationOpenController(),
        ),
        Provider<LocationCloseController>(
          create: (_) => LocationCloseController(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'BuscaBus',
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        primaryColor: Color.fromRGBO(27, 137, 250, 1),
        accentColor: Color.fromRGBO(27, 137, 250, 1),
        scaffoldBackgroundColor: Colors.grey[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        dividerColor: Colors.grey[800],
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 2,
          iconTheme: IconThemeData(
            color: Colors.grey[700],
          ),
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.grey[800],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),      
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}