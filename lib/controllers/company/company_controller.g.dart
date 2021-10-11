// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompanyController on _CompanyController, Store {
  final _$companyAtom = Atom(name: '_CompanyController.company');

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

  final _$_CompanyControllerActionController =
      ActionController(name: '_CompanyController');

  @override
  Future<void> addDriver(Driver driver) {
    final _$actionInfo = _$_CompanyControllerActionController.startAction(
        name: '_CompanyController.addDriver');
    try {
      return super.addDriver(driver);
    } finally {
      _$_CompanyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> addBus(Bus bus) {
    final _$actionInfo = _$_CompanyControllerActionController.startAction(
        name: '_CompanyController.addBus');
    try {
      return super.addBus(bus);
    } finally {
      _$_CompanyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> addLine(Line line) {
    final _$actionInfo = _$_CompanyControllerActionController.startAction(
        name: '_CompanyController.addLine');
    try {
      return super.addLine(line);
    } finally {
      _$_CompanyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> addStop(Stop stop) {
    final _$actionInfo = _$_CompanyControllerActionController.startAction(
        name: '_CompanyController.addStop');
    try {
      return super.addStop(stop);
    } finally {
      _$_CompanyControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
company: ${company}
    ''';
  }
}
