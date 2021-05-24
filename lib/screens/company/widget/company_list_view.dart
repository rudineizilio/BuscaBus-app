import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompanyListView extends StatefulWidget {
  final IconData icon;
  final List<dynamic> itens;
  final bool visibleButtons;

  CompanyListView({
    @required this.icon,
    @required this.itens,
    this.visibleButtons = true,
  });

  @override
  _CompanyListViewState createState() => _CompanyListViewState();
}

class _CompanyListViewState extends State<CompanyListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          height: 5,
          color: Theme.of(context).accentColor,
        );
      },
      itemCount: widget.itens.length,
      itemBuilder: (context, index) {
        final dynamic item = widget.itens[index];

        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).accentColor,
                child: Center(
                  child: FaIcon(
                    widget.icon,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(item),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: widget.visibleButtons,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    button(
                      icon: Icons.edit,
                      color: Theme.of(context).accentColor,
                      tooltip: 'Editar',
                      function: () {
                        print('Tela de edição');
                      }
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    button(
                      icon: Icons.delete,
                      color: Colors.red,
                      tooltip: 'Excluir',
                      function: () {
                        print('Excluir registro');
                      }
                    ),                  
                  ],
                ),
              ),
            ],
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
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5)
          ),
          child: Center(
            child: Icon(
              icon,
              size: 12,
              color: Colors.white,
            ),
          ),
        ),
        onTap: function,
      ),
    );
  }
}