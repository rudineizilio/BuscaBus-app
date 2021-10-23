// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_close_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocationCloseController on _LocationCloseController, Store {
  final _$locationCloseAtom =
      Atom(name: '_LocationCloseController.locationClose');

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

  final _$addCloseLocationAsyncAction =
      AsyncAction('_LocationCloseController.addCloseLocation');

  @override
  Future<void> addCloseLocation(LocationClose location) {
    return _$addCloseLocationAsyncAction
        .run(() => super.addCloseLocation(location));
  }

  @override
  String toString() {
    return '''
locationClose: ${locationClose}
    ''';
  }
}
