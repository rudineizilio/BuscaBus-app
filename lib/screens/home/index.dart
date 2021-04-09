import 'package:buscabus/widgets/default_appBar.dart';
import 'package:flutter/material.dart';
import '../../widgets/map.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: 'BuscaBus',
      ),
      body: MapWidget(),
    );
  }
}