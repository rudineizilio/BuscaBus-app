import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../controllers/login/login_controller.dart';
import '../../login/index.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  LoginController _loginController;

  @override
  void didChangeDependencies() {
    _loginController = Provider.of<LoginController>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(        
        direction: Axis.vertical,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            height: 200,
            width: double.infinity,
            child: SvgPicture.asset('lib/assets/images/people_location.svg'),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
          ),
          Expanded(
            child: Container(              
              color: Theme.of(context).backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: Theme.of(context).backgroundColor,
                    child: InkWell(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, right: 30),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.home,
                              color: Colors.white,
                              size: 18,
                            ),
                            VerticalDivider(
                              width: 10,
                              color: Colors.transparent,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),                  
                  Observer(builder: (_) {
                    return InkWell(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.userAlt,
                              color: Colors.grey[700],
                              size: 18,
                            ),
                            VerticalDivider(
                              width: 10,
                              color: Colors.transparent,
                            ),
                            Text(
                              'Motorista',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        _loginController.setLoginType('driver');

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },                        
                    );
                  }),
                  Observer(builder: (_) {
                    return InkWell(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.building,
                              color: Colors.grey[700],
                              size: 18,
                            ),
                            VerticalDivider(
                              width: 10,
                              color: Colors.transparent,
                            ),
                            Text(
                              'Empresa',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        _loginController.setLoginType('company');

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
    );
  }
}