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

  final _$driverPositionAtom = Atom(name: '_DriverController.driverPosition');

  @override
  Position get driverPosition {
    _$driverPositionAtom.reportRead();
    return super.driverPosition;
  }

  @override
  set driverPosition(Position value) {
    _$driverPositionAtom.reportWrite(value, super.driverPosition, () {
      super.driverPosition = value;
    });
  }

  final _$serviceEnabledAtom = Atom(name: '_DriverController.serviceEnabled');

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
      Atom(name: '_DriverController.locationPermission');

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

  final _$getLocationEnabledAsyncAction =
      AsyncAction('_DriverController.getLocationEnabled');

  @override
  Future<void> getLocationEnabled() {
    return _$getLocationEnabledAsyncAction
        .run(() => super.getLocationEnabled());
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
  void getPosition() {
    final _$actionInfo = _$_DriverControllerActionController.startAction(
        name: '_DriverController.getPosition');
    try {
      return super.getPosition();
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
driverPosition: ${driverPosition},
serviceEnabled: ${serviceEnabled},
locationPermission: ${locationPermission},
sharedButtonEnabled: ${sharedButtonEnabled}
    ''';
  }
}
