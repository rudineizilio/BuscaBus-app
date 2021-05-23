import 'package:buscabus/controllers/login/login_controller.dart';
import 'package:buscabus/widgets/default_appBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CompanyScreen extends StatefulWidget {
  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  LoginController _loginController;

  @override
  void didChangeDependencies() {
    _loginController = Provider.of<LoginController>(context);  

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Empresa',
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            tooltip: 'Sair',
            icon: FaIcon(
              FontAwesomeIcons.signOutAlt,
              color: Theme.of(context).accentColor,
              size: 20,
            ),
            onPressed: () {
              _loginController.logout();

              Navigator.pop(context); 
            }
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 1,
            child: buttonCategory(
              icon: FontAwesomeIcons.building,
              label: 'Cadastrar Empresa',
            ),
          ),
          Divider(
            height: 0,
          ),
          Flexible(
            flex: 1,
            child: buttonCategory(
              icon: FontAwesomeIcons.solidUser,
              label: 'Cadastrar Motorista'
            ),
          ),
          Divider(
            height: 0,
          ),
          Flexible(
            flex: 1,
            child: buttonCategory(
              icon: FontAwesomeIcons.bus,
              label: 'Cadastrar Ônibus',
            ),
          ),
          Divider(
            height: 0,
          ),
          Flexible(
            flex: 1,
            child: buttonCategory(
              icon: FontAwesomeIcons.projectDiagram,
              label: 'Cadastrar Linha'
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonCategory({@required IconData icon, @required String label}) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                icon,
                size: 20,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 16
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () => print(label),
    );    
  }
}