// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zipcode_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ZipcodeStore on _ZipcodeStore, Store {
  Computed<String> _$clearZipcodeComputed;

  @override
  String get clearZipcode =>
      (_$clearZipcodeComputed ??= Computed<String>(() => super.clearZipcode,
              name: '_ZipcodeStore.clearZipcode'))
          .value;

  final _$zipcodeAtom = Atom(name: '_ZipcodeStore.zipcode');

  @override
  String get zipcode {
    _$zipcodeAtom.reportRead();
    return super.zipcode;
  }

  @override
  set zipcode(String value) {
    _$zipcodeAtom.reportWrite(value, super.zipcode, () {
      super.zipcode = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ZipcodeStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_ZipcodeStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$addressAtom = Atom(name: '_ZipcodeStore.address');

  @override
  Address get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$_searchZipcodeAsyncAction =
      AsyncAction('_ZipcodeStore._searchZipcode');

  @override
  Future<void> _searchZipcode() {
    return _$_searchZipcodeAsyncAction.run(() => super._searchZipcode());
  }

  final _$_ZipcodeStoreActionController =
      ActionController(name: '_ZipcodeStore');

  @override
  void setZipcode(String valeu) {
    final _$actionInfo = _$_ZipcodeStoreActionController.startAction(
        name: '_ZipcodeStore.setZipcode');
    try {
      return super.setZipcode(valeu);
    } finally {
      _$_ZipcodeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _reset() {
    final _$actionInfo = _$_ZipcodeStoreActionController.startAction(
        name: '_ZipcodeStore._reset');
    try {
      return super._reset();
    } finally {
      _$_ZipcodeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
zipcode: ${zipcode},
loading: ${loading},
error: ${error},
address: ${address},
clearZipcode: ${clearZipcode}
    ''';
  }
}
