import 'dart:ui';
import 'package:buscabus/controllers/company/company_controller.dart';
import 'package:buscabus/controllers/map/map_controller.dart';
import 'package:buscabus/widgets/defaul_modalbottomsheet.dart';
import 'package:buscabus/widgets/default_tabtoggler.dart';
import 'package:flutter/material.dart';
import 'package:buscabus/screens/home/widgets/map.dart';
import 'package:buscabus/screens/home/widgets/menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../widgets/default_appBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MapController _mapController;
  CompanyController _companyController;
  dynamic _companyData;

  @override
  void didChangeDependencies() {
    _mapController = Provider.of<MapController>(context);
    _companyController = Provider.of<CompanyController>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Container(
          width: 90,
          child: Image.asset('lib/assets/images/logo.png')
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          MapScreen(),
          FutureBuilder(
            future: _companyController.company.doc('262gZboPV0OZfjQxzfko').get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('Error: ${snapshot.error}');
              }
              if (snapshot.hasData) {
                _companyData = snapshot.data;

                return Positioned(
                  left: 0,
                  right: 0,
                  top: 30,
                  child: DefaultTabToggler(
                    items: ['Linhas', 'Pontos'],
                  ),
                );
              }
              return CircularProgressIndicator();
            }
          ),
        ],
      ),
      endDrawer: Drawer(
        child: MenuScreen()
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).accentColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.filter_alt_rounded,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
              'Filtrar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ]
          ),
        ),
        onTap: () {
          DefaultModalBottomSheet(          
            title: _mapController.filterType == 'lines'
              ? 'Filtrar Linhas'
              : 'Filtrar Pontos',
            items: _mapController.filterType == 'lines'
              ? _companyData['lines'].map((e) {
                  return ItemModalBottomSheet(
                    body: Container(
                      child: Text(e['title']),
                    ),
                    onTap: () {
                      print('Seleciona linha ${e['title']}');
                    }
                  );
                }).toList()
              : _companyData['stops'].map((e) {
                  return ItemModalBottomSheet(
                    body: Container(
                      child: Text(e['description']),
                    ),
                    onTap: () {
                      print('Seleciona ponto ${e['description']}');
                    }
                  );
                }).toList(),
          ).show(context);
        }
      ),
    );
  }

  Widget lineList() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          height: 5,
          color: Theme.of(context).accentColor,
          indent: 70,
        );
      },
      itemCount: 50,
      itemBuilder: (context, index){
        return ListTile(
          leading: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.mapSigns,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          title: Text(
            'Linha Teste $index'
          ),
          onTap: () => print('Pressionou o item $index'),
        );
      },
    );
  } 

  // void showFilterDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       backgroundColor: Theme.of(context).backgroundColor,
  //       contentPadding: const EdgeInsets.all(0),
  //       title: Container(
  //         margin: const EdgeInsets.only(bottom: 10),
  //         child: TextField(              
  //           decoration: InputDecoration(
  //             hintText: 'Buscar por',
  //             suffixIcon: Icon(
  //               Icons.search,
  //               color: Theme.of(context).accentColor,
  //             ),
  //           ),
  //           onChanged: (value) => print(value),
  //         ),
  //       ),
  //       content: lineList(),
  //       actions: [
  //         InkWell(
  //           child: Container(
  //             margin: const EdgeInsets.all(10),
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   'Salvar',
  //                   style: TextStyle(
  //                     color: Theme.of(context).accentColor,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //                 SizedBox(width: 5),
  //                 Icon(
  //                   Icons.check,
  //                   color: Theme.of(context).accentColor,
  //                 ),
  //               ],
  //             ),
  //           ),
  //           onTap: () {
  //             print('Aplica filtro selecionado');
  //             Navigator.pop(context);              
  //           },            
  //         ),
  //       ],        
  //     ),
  //   );
  // }    
}
