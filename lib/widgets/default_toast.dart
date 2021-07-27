import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum DefaultToastType {
  info,
  success,
  danger,
  warning,
  deleted,
}

class DefaultToast {
  final String message;
  final DefaultToastType toastType;
  final Function whenComplete;

  DefaultToast({
    @required this.message,
    this.toastType,
    this.whenComplete,
  });

  Icon _getIcon() {
    switch (toastType) {
      case DefaultToastType.info:
        return Icon(
          Icons.info_outline,
          color: Colors.blue,
        );
      case DefaultToastType.success:
        return Icon(
          Icons.check_circle_outline,
          color: Colors.green,
        );
      case DefaultToastType.danger:
        return Icon(
          Icons.dangerous,
          color: Colors.red,
        );
      case DefaultToastType.warning:
        return Icon(
          Icons.warning,
          color: Colors.orange,
        );
      case DefaultToastType.deleted:
        return Icon(
          Icons.delete_outlined,
          color: Colors.red,
        );
      default:
        return Icon(
          Icons.info_outline,
          color: Colors.blue,
        );
    }
  }

  void show(BuildContext context) {
    Flushbar(
      padding: const EdgeInsets.symmetric(vertical: 20),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      duration: const Duration(seconds: 3),
      icon: _getIcon(),
    ).show(context).whenComplete(whenComplete);
  }
}