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
  Computed<dynamic> _$locationInTimeComputed;

  @override
  dynamic get locationInTime => (_$locationInTimeComputed ??= Computed<dynamic>(
          () => super.locationInTime,
          name: '_DriverController.locationInTime'))
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

  final _$timerAtom = Atom(name: '_DriverController.timer');

  @override
  Timer get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  @override
  set timer(Timer value) {
    _$timerAtom.reportWrite(value, super.timer, () {
      super.timer = value;
    });
  }

  final _$driverLocationAtom = Atom(name: '_DriverController.driverLocation');

  @override
  CollectionReference get driverLocation {
    _$driverLocationAtom.reportRead();
    return super.driverLocation;
  }

  @override
  set driverLocation(CollectionReference value) {
    _$driverLocationAtom.reportWrite(value, super.driverLocation, () {
      super.driverLocation = value;
    });
  }

  final _$positionStreamAtom = Atom(name: '_DriverController.positionStream');

  @override
  StreamSubscription<Position> get positionStream {
    _$positionStreamAtom.reportRead();
    return super.positionStream;
  }

  @override
  set positionStream(StreamSubscription<Position> value) {
    _$positionStreamAtom.reportWrite(value, super.positionStream, () {
      super.positionStream = value;
    });
  }

  final _$statusAtom = Atom(name: '_DriverController.status');

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$positionLocationAtom =
      Atom(name: '_DriverController.positionLocation');

  @override
  Position get positionLocation {
    _$positionLocationAtom.reportRead();
    return super.positionLocation;
  }

  @override
  set positionLocation(Position value) {
    _$positionLocationAtom.reportWrite(value, super.positionLocation, () {
      super.positionLocation = value;
    });
  }

  final _$listenPositionAsyncAction =
      AsyncAction('_DriverController.listenPosition');

  @override
  Future<void> listenPosition() {
    return _$listenPositionAsyncAction.run(() => super.listenPosition());
  }

  final _$getPositionAsyncAction = AsyncAction('_DriverController.getPosition');

  @override
  Future<void> getPosition() {
    return _$getPositionAsyncAction.run(() => super.getPosition());
  }

  final _$_DriverControllerActionController =
      ActionController(name: '_DriverController');

  @override
  void setStatus(String value) {
    final _$actionInfo = _$_DriverControllerActionController.startAction(
        name: '_DriverController.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$_DriverControllerActionController.endAction(_$actionInfo);
    }
  }

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
  Future<void> updateDriverLocation() {
    final _$actionInfo = _$_DriverControllerActionController.startAction(
        name: '_DriverController.updateDriverLocation');
    try {
      return super.updateDriverLocation();
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
timer: ${timer},
driverLocation: ${driverLocation},
positionStream: ${positionStream},
status: ${status},
positionLocation: ${positionLocation},
sharedButtonEnabled: ${sharedButtonEnabled},
locationInTime: ${locationInTime}
    ''';
  }
}
