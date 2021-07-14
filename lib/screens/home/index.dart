import 'package:flutter/material.dart';
import 'package:buscabus/screens/home/widgets/map.dart';
import 'package:buscabus/screens/home/widgets/menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/default_appBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: MapScreen(),
      endDrawer: Drawer(
        child: MenuScreen()
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 3,
        tooltip: 'Filtrar linha',
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
        ),
        onPressed: () => showFilterDialog(context),
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

  void showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Theme.of(context).backgroundColor,
        contentPadding: const EdgeInsets.all(0),
        title: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: TextField(              
            decoration: InputDecoration(
              hintText: 'Buscar por',
              suffixIcon: Icon(
                Icons.search,
                color: Theme.of(context).accentColor,
              ),
            ),
            onChanged: (value) => print(value),
          ),
        ),
        content: lineList(),
        actions: [
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Salvar',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.check,
                    color: Theme.of(context).accentColor,
                  ),
                ],
              ),
            ),
            onTap: () {
              print('Aplica filtro selecionado');
              Navigator.pop(context);              
            },            
          ),
        ],        
      ),
    );
  }    
}
