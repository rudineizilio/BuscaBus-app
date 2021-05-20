import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final PreferredSizeWidget bottom;
  final bool automaticallyImplyLeading;
  final List<Widget> actions;

  DefaultAppBar({ 
    @required this.title,
    this.centerTitle,
    this.bottom,
    this.automaticallyImplyLeading = true,
    this.actions,
  });

  @override
  _DefaultAppBarState createState() => _DefaultAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));  
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          widget.title,
        ),
      ),
      centerTitle: widget.centerTitle,
      titleSpacing: 0,
      elevation: 3,
      actions: widget.actions,
    );
  }
}