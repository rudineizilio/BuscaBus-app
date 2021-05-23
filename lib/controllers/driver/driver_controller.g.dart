// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DriverController on _DriverController, Store {
  Computed<bool> _$sharedButtonEnabledComputed;

  @override
  bool get sharedButtonEnabled => (_$sharedButtonEnabledComputed ??=
          Computed<bool>(() => super.sharedButtonEnabled,
              name: '_DriverController.sharedButtonEnabled'))
      .value;

  final _$busSelectedAtom = Atom(name: '_DriverController.busSelected');

  @override
  String get busSelected {
    _$busSelectedAtom.reportRead();
    return super.busSelected;
  }

  @override
  set busSelected(String value) {
    _$busSelectedAtom.reportWrite(value, super.busSelected, () {
      super.busSelected = value;
    });
  }

  final _$lineSelectedAtom = Atom(name: '_DriverController.lineSelected');

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

  final _$sharedLocationAtom = Atom(name: '_DriverController.sharedLocation');

  @override
  bool get sharedLocation {
    _$sharedLocationAtom.reportRead();
    return super.sharedLocation;
  }

  @override
  set sharedLocation(bool value) {
    _$sharedLocationAtom.reportWrite(value, super.sharedLocation, () {
      super.sharedLocation = value;
    });
  }

  final _$_DriverControllerActionController =
      ActionController(name: '_DriverController');

  @override
  void setBus(String value) {
    final _$actionInfo = _$_DriverControllerActionController.startAction(
        name: '_DriverController.setBus');
    try {
      return super.setBus(value);
    } finally {
      _$_DriverControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLine(String value) {
    final _$actionInfo = _$_DriverControllerActionController.startAction(
        name: '_DriverController.setLine');
    try {
      return super.setLine(value);
    } finally {
      _$_DriverControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCharedLocation() {
    final _$actionInfo = _$_DriverControllerActionController.startAction(
        name: '_DriverController.setCharedLocation');
    try {
      return super.setCharedLocation();
    } finally {
      _$_DriverControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
busSelected: ${busSelected},
lineSelected: ${lineSelected},
sharedLocation: ${sharedLocation},
sharedButtonEnabled: ${sharedButtonEnabled}
    ''';
  }
}
