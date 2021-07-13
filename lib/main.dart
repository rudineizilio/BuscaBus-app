import 'package:buscabus/controllers/driver/driver_controller.dart';
import 'package:buscabus/controllers/login/login_controller.dart';
import 'package:buscabus/controllers/theme/custom_theme_controller.dart';
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
        Provider<CustomThemeController>(
          create: (_) => CustomThemeController(),
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
  CustomThemeController _customThemeController;

  @override
  void didChangeDependencies() {
    _customThemeController = Provider.of<CustomThemeController>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'BuscaBus',
      // theme: _customThemeController.customTheme,
      theme: ThemeData(
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
        ),      
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}