import 'package:buscabus/screens/home/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/map/map_controller.dart';

void main() {
  MultiProvider(
    providers: [
      Provider<MapController>(
        create: (_) => MapController(),
      ),
    ],
    child: MaterialApp(
      title: 'BuscaBus',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuscaBus',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}