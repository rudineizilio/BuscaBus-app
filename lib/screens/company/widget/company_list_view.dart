import 'package:buscabus/controllers/company/company_controller.dart';
import 'package:buscabus/screens/company/edit/bus.dart';
import 'package:buscabus/screens/company/edit/driver.dart';
import 'package:buscabus/screens/company/edit/line.dart';
import 'package:buscabus/screens/company/edit/stop.dart';
import 'package:buscabus/widgets/default_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CompanyListView extends StatefulWidget {
  final IconData icon;
  final List<dynamic> itens;
  final bool visibleButtons;
  final String fieldName;
  final String type;
  final Function callback;

  CompanyListView({
    @required this.icon,
    @required this.itens,
    this.visibleButtons = true,
    this.fieldName,
    @required this.type,
    @required this.callback,
  });

  @override
  _CompanyListViewState createState() => _CompanyListViewState();
}

class _CompanyListViewState extends State<CompanyListView> {
  CompanyController _companyController;

  @override
  void didChangeDependencies() {
    _companyController = Provider.of<CompanyController>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          height: 5,
          color: Theme.of(context).accentColor,
          indent: 70,
        );
      },
      itemCount: widget.itens.length,
      itemBuilder: (context, index) {
        final dynamic item = widget.itens[index];

        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Theme.of(context).accentColor,
              child: Center(
                child: FaIcon(
                  widget.icon,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
            title: Text(getTitle(item)),
            trailing: Visibility(
              visible: widget.visibleButtons,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Observer(builder: (_) {
                    return button(
                      icon: Icons.edit,
                      color: Color.fromRGBO(18, 178, 89, 1),
                      tooltip: 'Alterar',
                      function: () {                      
                        if (widget.type == 'Motorista') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditDriverScreen(
                              driver: item,
                              callback: widget.callback,
                            )),
                          );
                        } else if (widget.type == 'Ônibus') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditBusScreen(
                              bus: item,
                              callback: widget.callback,
                            )),
                          );                          
                        } else if (widget.type == 'Linha') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditLineScreen(
                              line: item,
                              callback: widget.callback,
                            )),
                          );                          
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditStopScreen(
                              stop: item,
                              callback: widget.callback,
                            )),
                          );                          
                        }
                      }
                    );
                  }),
                  SizedBox(width: 10),
                  Observer(builder: (_) {
                    return button(
                      icon: Icons.delete,
                      color: Colors.red,
                      tooltip: 'Excluir',
                      function: () async {                      
                        if (widget.type == 'Motorista') {
                          await _companyController.deleteDriver(item);
                        } else if (widget.type == 'Ônibus') {
                          await _companyController.deleteBus(item);
                        } else if (widget.type == 'Linha') {
                          await _companyController.deleteLine(item);
                        } else {
                          await _companyController.deleteStop(item);
                        }

                        DefaultToast(
                          message: '${widget.type} removido :)',
                          toastType: DefaultToastType.success,
                        ).show(context);

                        widget.callback();
                      }
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget button({ @required IconData icon, @required Color color, @required String tooltip, @required Function function }) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(100)
          ),
          child: Center(
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
        onTap: function,
      ),
    );
  }

  String getTitle(dynamic item) {
    String title = '';

    switch (widget.type) {
      case 'Motorista':
        return title = item['name'];
        break;
      case 'Ônibus':
        return title = item['licensePlate'];
        break;
      case 'Linha':
        return title = item['title'];
        break;
      case 'Ponto':
        return title = item['description'];
        break;                        
    }

    return title;
  }
}