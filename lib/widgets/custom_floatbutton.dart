import 'package:flutter/material.dart';

class CustomFloatButton extends StatelessWidget {
  final String description;
  final Function onTap;

  const CustomFloatButton({
    @required this.description,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(50)
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Center(
          child: Text(
            description,
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ),
      ),
      onTap: onTap,
    );
  }
}