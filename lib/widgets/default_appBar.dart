import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final PreferredSizeWidget bottom;

  DefaultAppBarWidget({ 
    @required this.title,
    this.centerTitle,
    this.bottom,
  });

  @override
  _DefaultAppBarWidgetState createState() => _DefaultAppBarWidgetState();

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));  
}

class _DefaultAppBarWidgetState extends State<DefaultAppBarWidget> {
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          widget.title,
          style: TextStyle(
            color: Colors.grey[900]
          ),
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: widget.centerTitle,
      titleSpacing: 0,
      elevation: 3,
      iconTheme: IconThemeData(
        color: Colors.grey[900],
        size: 16
      ),
    );
  }
}