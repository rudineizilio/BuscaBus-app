import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum LoadingSize {
  small,
  medium,
  large,
}

class Loading extends StatelessWidget {
  final LoadingSize size;

  Loading({
    this.size = LoadingSize.medium,
  });

  double _getContainerSize() {
    switch (size) {
      case LoadingSize.small:
        return 13;
      case LoadingSize.medium:
        return 34;
      case LoadingSize.large:
        return 89;
      default:
        return 34;
    }
  }

  double _getStrokeSize() {
    switch (size) {
      case LoadingSize.small:
        return 2;
      case LoadingSize.medium:
        return 5;
      case LoadingSize.large:
        return 13;
      default:
        return 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double size = _getContainerSize();
    final double strokeWidth = _getStrokeSize();

    return Center(
      child: Container(
        width: size,
        height: size,
        margin: const EdgeInsets.all(13),
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          backgroundColor: Theme.of(context).accentColor.withAlpha(100),
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
