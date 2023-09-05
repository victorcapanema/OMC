// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storm_counter_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StormCounterController on _StormCounterController, Store {
  late final _$countersAtom =
      Atom(name: '_StormCounterController.counters', context: context);

  @override
  ObservableList<int> get counters {
    _$countersAtom.reportRead();
    return super.counters;
  }

  @override
  set counters(ObservableList<int> value) {
    _$countersAtom.reportWrite(value, super.counters, () {
      super.counters = value;
    });
  }

  late final _$_StormCounterControllerActionController =
      ActionController(name: '_StormCounterController', context: context);

  @override
  void clearCounter(int index) {
    final _$actionInfo = _$_StormCounterControllerActionController.startAction(
        name: '_StormCounterController.clearCounter');
    try {
      return super.clearCounter(index);
    } finally {
      _$_StormCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCounter(bool isAdd, int index) {
    final _$actionInfo = _$_StormCounterControllerActionController.startAction(
        name: '_StormCounterController.updateCounter');
    try {
      return super.updateCounter(isAdd, index);
    } finally {
      _$_StormCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counters: ${counters}
    ''';
  }
}
