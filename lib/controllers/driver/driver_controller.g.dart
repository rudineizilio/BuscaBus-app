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

  final _$companyAtom = Atom(name: '_DriverController.company');

  @override
  CollectionReference get company {
    _$companyAtom.reportRead();
    return super.company;
  }

  @override
  set company(CollectionReference value) {
    _$companyAtom.reportWrite(value, super.company, () {
      super.company = value;
    });
  }

  final _$locationCloseAtom = Atom(name: '_DriverController.locationClose');

  @override
  CollectionReference get locationClose {
    _$locationCloseAtom.reportRead();
    return super.locationClose;
  }

  @override
  set locationClose(CollectionReference value) {
    _$locationCloseAtom.reportWrite(value, super.locationClose, () {
      super.locationClose = value;
    });
  }

  final _$locationOpenAtom = Atom(name: '_DriverController.locationOpen');

  @override
  CollectionReference get locationOpen {
    _$locationOpenAtom.reportRead();
    return super.locationOpen;
  }

  @override
  set locationOpen(CollectionReference value) {
    _$locationOpenAtom.reportWrite(value, super.locationOpen, () {
      super.locationOpen = value;
    });
  }

  final _$driversAtom = Atom(name: '_DriverController.drivers');

  @override
  List<Driver> get drivers {
    _$driversAtom.reportRead();
    return super.drivers;
  }

  @override
  set drivers(List<Driver> value) {
    _$driversAtom.reportWrite(value, super.drivers, () {
      super.drivers = value;
    });
  }

  final _$currentLocationAtom = Atom(name: '_DriverController.currentLocation');

  @override
  LocationOpen get currentLocation {
    _$currentLocationAtom.reportRead();
    return super.currentLocation;
  }

  @override
  set currentLocation(LocationOpen value) {
    _$currentLocationAtom.reportWrite(value, super.currentLocation, () {
      super.currentLocation = value;
    });
  }

  final _$currentLocationIdAtom =
      Atom(name: '_DriverController.currentLocationId');

  @override
  String get currentLocationId {
    _$currentLocationIdAtom.reportRead();
    return super.currentLocationId;
  }

  @override
  set currentLocationId(String value) {
    _$currentLocationIdAtom.reportWrite(value, super.currentLocationId, () {
      super.currentLocationId = value;
    });
  }

  final _$listenPositionAsyncAction =
      AsyncAction('_DriverController.listenPosition');

  @override
  Future<void> listenPosition() {
    return _$listenPositionAsyncAction.run(() => super.listenPosition());
  }

  final _$openDriverLocationAsyncAction =
      AsyncAction('_DriverController.openDriverLocation');

  @override
  Future<void> openDriverLocation(LocationOpen location) {
    return _$openDriverLocationAsyncAction
        .run(() => super.openDriverLocation(location));
  }

  final _$addDriverLocationAsyncAction =
      AsyncAction('_DriverController.addDriverLocation');

  @override
  Future<void> addDriverLocation(LocationOpen location) {
    return _$addDriverLocationAsyncAction
        .run(() => super.addDriverLocation(location));
  }

  final _$deleteDriverLocationAsyncAction =
      AsyncAction('_DriverController.deleteDriverLocation');

  @override
  Future<void> deleteDriverLocation(LocationClose location) {
    return _$deleteDriverLocationAsyncAction
        .run(() => super.deleteDriverLocation(location));
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
  void setSharedLocation(bool value) {
    final _$actionInfo = _$_DriverControllerActionController.startAction(
        name: '_DriverController.setSharedLocation');
    try {
      return super.setSharedLocation(value);
    } finally {
      _$_DriverControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDriverPosition(Position position) {
    final _$actionInfo = _$_DriverControllerActionController.startAction(
        name: '_DriverController.setDriverPosition');
    try {
      return super.setDriverPosition(position);
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
  void setTimerPeriodic() {
    final _$actionInfo = _$_DriverControllerActionController.startAction(
        name: '_DriverController.setTimerPeriodic');
    try {
      return super.setTimerPeriodic();
    } finally {
      _$_DriverControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancelTimer() {
    final _$actionInfo = _$_DriverControllerActionController.startAction(
        name: '_DriverController.cancelTimer');
    try {
      return super.cancelTimer();
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
positionStream: ${positionStream},
status: ${status},
positionLocation: ${positionLocation},
company: ${company},
locationClose: ${locationClose},
locationOpen: ${locationOpen},
drivers: ${drivers},
currentLocation: ${currentLocation},
currentLocationId: ${currentLocationId},
sharedButtonEnabled: ${sharedButtonEnabled}
    ''';
  }
}