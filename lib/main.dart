import 'package:buscabus/screens/home/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BuscaBusApp());
}

class BuscaBusApp extends StatelessWidget {
  // This widget is the root of your application.
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
