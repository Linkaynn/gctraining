// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MStore on _MStore, Store {
  final _$isLoadingAtom = Atom(name: '_MStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$loadingsAtom = Atom(name: '_MStore.loadings');

  @override
  Map<String, bool> get loadings {
    _$loadingsAtom.reportRead();
    return super.loadings;
  }

  @override
  set loadings(Map<String, bool> value) {
    _$loadingsAtom.reportWrite(value, super.loadings, () {
      super.loadings = value;
    });
  }

  final _$hasErrorAtom = Atom(name: '_MStore.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  final _$_MStoreActionController = ActionController(name: '_MStore');

  @override
  dynamic setLoading(String key, bool value) {
    final _$actionInfo =
        _$_MStoreActionController.startAction(name: '_MStore.setLoading');
    try {
      return super.setLoading(key, value);
    } finally {
      _$_MStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
loadings: ${loadings},
hasError: ${hasError}
    ''';
  }
}
