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

  final _$getPositionAsyncAction = AsyncAction('_MapController.getPosition');

  @override
  Future<void> getPosition() {
    return _$getPositionAsyncAction.run(() => super.getPosition());
  }

  @override
  String toString() {
    return '''
serviceEnabled: ${serviceEnabled},
locationPermission: ${locationPermission}
    ''';
  }
}
