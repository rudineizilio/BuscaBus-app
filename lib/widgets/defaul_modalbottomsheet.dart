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
  final List<ItemModalBottomSheet> items;

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
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // or some other color
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: items.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              item.icon != null
                                ? Icon(
                                    item.icon,
                                    color: Theme.of(context).primaryColor,
                                    size: 18,
                                  )
                                : Container(),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: item.body
                              ),
                            ],
                          ),
                          onTap: item.onTap,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}