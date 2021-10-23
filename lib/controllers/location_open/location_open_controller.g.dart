// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_open_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocationOpenController on _LocationOpenController, Store {
  final _$locationOpenAtom = Atom(name: '_LocationOpenController.locationOpen');

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

  @override
  String toString() {
    return '''
locationOpen: ${locationOpen}
    ''';
  }
}
