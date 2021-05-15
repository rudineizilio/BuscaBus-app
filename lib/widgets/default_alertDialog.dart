import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultAlertDialog {
  final IconData icon;
  final String message;
  final String description;
  final String confirmText;
  final String cancelText;
  final void Function() onConfirm;

  DefaultAlertDialog({
    this.icon = Icons.help_outline,
    this.message,
    this.description = '',
    this.confirmText = 'Sim',
    this.cancelText = 'Cancelar',
    this.onConfirm,
  });

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Icon(
          icon,
          size: 50,
          color: Theme.of(context).primaryColor,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Visibility(
              visible: description.isNotEmpty,
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              cancelText,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(
                width: 2,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text(
              confirmText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(
                width: 2,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () {
              onConfirm();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}