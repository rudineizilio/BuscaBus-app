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

  final _$filterTypeAtom = Atom(name: '_MapController.filterType');

  @override
  String get filterType {
    _$filterTypeAtom.reportRead();
    return super.filterType;
  }

  @override
  set filterType(String value) {
    _$filterTypeAtom.reportWrite(value, super.filterType, () {
      super.filterType = value;
    });
  }

  final _$markersAtom = Atom(name: '_MapController.markers');

  @override
  List<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(List<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
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
  void setFilterType(String value) {
    final _$actionInfo = _$_MapControllerActionController.startAction(
        name: '_MapController.setFilterType');
    try {
      return super.setFilterType(value);
    } finally {
      _$_MapControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMarkers(List<dynamic> stops, List<dynamic> locationsOpen) {
    final _$actionInfo = _$_MapControllerActionController.startAction(
        name: '_MapController.addMarkers');
    try {
      return super.addMarkers(stops, locationsOpen);
    } finally {
      _$_MapControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
serviceEnabled: ${serviceEnabled},
locationPermission: ${locationPermission},
filterType: ${filterType},
markers: ${markers}
    ''';
  }
}
