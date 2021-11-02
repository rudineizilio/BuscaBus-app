// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapController on _MapController, Store {
  final _$_determinePositionAtom =
      Atom(name: '_MapController._determinePosition');

  @override
  Future<Position> get _determinePosition {
    _$_determinePositionAtom.reportRead();
    return super._determinePosition;
  }

  @override
  set _determinePosition(Future<Position> value) {
    _$_determinePositionAtom.reportWrite(value, super._determinePosition, () {
      super._determinePosition = value;
    });
  }

  final _$serviceEnabledAtom = Atom(name: '_MapController.serviceEnabled');

  @override
  bool get serviceEnabled {
    _$serviceEnabledAtom.reportRead();
    return super.serviceEnabled;
  }

  @override
  set serviceEnabled(bool value) {
    _$serviceEnabledAtom.reportWrite(value, super.serviceEnabled, () {
      super.serviceEnabled = value;
    });
  }

  final _$locationPermissionAtom =
      Atom(name: '_MapController.locationPermission');

  @override
  LocationPermission get locationPermission {
    _$locationPermissionAtom.reportRead();
    return super.locationPermission;
  }

  @override
  set locationPermission(LocationPermission value) {
    _$locationPermissionAtom.reportWrite(value, super.locationPermission, () {
      super.locationPermission = value;
    });
  }

  final _$tabSelectedAtom = Atom(name: '_MapController.tabSelected');

  @override
  int get tabSelected {
    _$tabSelectedAtom.reportRead();
    return super.tabSelected;
  }

  @override
  set tabSelected(int value) {
    _$tabSelectedAtom.reportWrite(value, super.tabSelected, () {
      super.tabSelected = value;
    });
  }

  final _$filterSelectedAtom = Atom(name: '_MapController.filterSelected');

  @override
  String get filterSelected {
    _$filterSelectedAtom.reportRead();
    return super.filterSelected;
  }

  @override
  set filterSelected(String value) {
    _$filterSelectedAtom.reportWrite(value, super.filterSelected, () {
      super.filterSelected = value;
    });
  }

  final _$lineSelectedAtom = Atom(name: '_MapController.lineSelected');

  @override
  String get lineSelected {
    _$lineSelectedAtom.reportRead();
    return super.lineSelected;
  }

  @override
  set lineSelected(String value) {
    _$lineSelectedAtom.reportWrite(value, super.lineSelected, () {
      super.lineSelected = value;
    });
  }

  final _$stopSelectedAtom = Atom(name: '_MapController.stopSelected');

  @override
  String get stopSelected {
    _$stopSelectedAtom.reportRead();
    return super.stopSelected;
  }

  @override
  set stopSelected(String value) {
    _$stopSelectedAtom.reportWrite(value, super.stopSelected, () {
      super.stopSelected = value;
    });
  }

  final _$getPositionAsyncAction = AsyncAction('_MapController.getPosition');

  @override
  Future<void> getPosition() {
    return _$getPositionAsyncAction.run(() => super.getPosition());
  }

  final _$_MapControllerActionController =
      ActionController(name: '_MapController');

  @override
  void setFilterSelected(String value) {
    final _$actionInfo = _$_MapControllerActionController.startAction(
        name: '_MapController.setFilterSelected');
    try {
      return super.setFilterSelected(value);
    } finally {
      _$_MapControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTabSelected(int value) {
    final _$actionInfo = _$_MapControllerActionController.startAction(
        name: '_MapController.setTabSelected');
    try {
      return super.setTabSelected(value);
    } finally {
      _$_MapControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLineSelected(String value) {
    final _$actionInfo = _$_MapControllerActionController.startAction(
        name: '_MapController.setLineSelected');
    try {
      return super.setLineSelected(value);
    } finally {
      _$_MapControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStopSelected(String value) {
    final _$actionInfo = _$_MapControllerActionController.startAction(
        name: '_MapController.setStopSelected');
    try {
      return super.setStopSelected(value);
    } finally {
      _$_MapControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
serviceEnabled: ${serviceEnabled},
locationPermission: ${locationPermission},
tabSelected: ${tabSelected},
filterSelected: ${filterSelected},
lineSelected: ${lineSelected},
stopSelected: ${stopSelected}
    ''';
  }
}
