import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemModalBottomSheet {
  IconData icon;
  Widget body;
  Function onTap;

  ItemModalBottomSheet({
    this.icon,
    @required this.body,
    this.onTap,
  });
}

class DefaultModalBottomSheet {
  final String title;
  final List<dynamic> items;

  DefaultModalBottomSheet({
    this.title,
    @required this.items,
  });

  void show(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 3,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, StateSetter state) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                        child: ListView(
                          children: items.map((item) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    item.icon != null
                                        ? Icon(
                                            item.icon,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 18,
                                          )
                                        : Container(),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(child: item.body),
                                  ],
                                ),
                                onTap: () => state(() {item.onTap();}),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
