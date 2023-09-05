// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_layout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterLayoutController on _CounterLayoutController, Store {
  late final _$nPlayersAtom =
      Atom(name: '_CounterLayoutController.nPlayers', context: context);

  @override
  int get nPlayers {
    _$nPlayersAtom.reportRead();
    return super.nPlayers;
  }

  @override
  set nPlayers(int value) {
    _$nPlayersAtom.reportWrite(value, super.nPlayers, () {
      super.nPlayers = value;
    });
  }

  late final _$lifeTotalAtom =
      Atom(name: '_CounterLayoutController.lifeTotal', context: context);

  @override
  int get lifeTotal {
    _$lifeTotalAtom.reportRead();
    return super.lifeTotal;
  }

  @override
  set lifeTotal(int value) {
    _$lifeTotalAtom.reportWrite(value, super.lifeTotal, () {
      super.lifeTotal = value;
    });
  }

  late final _$lifeTotalIndexAtom =
      Atom(name: '_CounterLayoutController.lifeTotalIndex', context: context);

  @override
  int get lifeTotalIndex {
    _$lifeTotalIndexAtom.reportRead();
    return super.lifeTotalIndex;
  }

  @override
  set lifeTotalIndex(int value) {
    _$lifeTotalIndexAtom.reportWrite(value, super.lifeTotalIndex, () {
      super.lifeTotalIndex = value;
    });
  }

  late final _$countersAtom =
      Atom(name: '_CounterLayoutController.counters', context: context);

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

  late final _$showNameAtom =
      Atom(name: '_CounterLayoutController.showName', context: context);

  @override
  bool get showName {
    _$showNameAtom.reportRead();
    return super.showName;
  }

  @override
  set showName(bool value) {
    _$showNameAtom.reportWrite(value, super.showName, () {
      super.showName = value;
    });
  }

  late final _$timerCountAtom =
      Atom(name: '_CounterLayoutController.timerCount', context: context);

  @override
  int get timerCount {
    _$timerCountAtom.reportRead();
    return super.timerCount;
  }

  @override
  set timerCount(int value) {
    _$timerCountAtom.reportWrite(value, super.timerCount, () {
      super.timerCount = value;
    });
  }

  late final _$isSearchAtom =
      Atom(name: '_CounterLayoutController.isSearch', context: context);

  @override
  bool get isSearch {
    _$isSearchAtom.reportRead();
    return super.isSearch;
  }

  @override
  set isSearch(bool value) {
    _$isSearchAtom.reportWrite(value, super.isSearch, () {
      super.isSearch = value;
    });
  }

  late final _$_CounterLayoutControllerActionController =
      ActionController(name: '_CounterLayoutController', context: context);

  @override
  void startCounter() {
    final _$actionInfo = _$_CounterLayoutControllerActionController.startAction(
        name: '_CounterLayoutController.startCounter');
    try {
      return super.startCounter();
    } finally {
      _$_CounterLayoutControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCounter() {
    final _$actionInfo = _$_CounterLayoutControllerActionController.startAction(
        name: '_CounterLayoutController.updateCounter');
    try {
      return super.updateCounter();
    } finally {
      _$_CounterLayoutControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancelTimer() {
    final _$actionInfo = _$_CounterLayoutControllerActionController.startAction(
        name: '_CounterLayoutController.cancelTimer');
    try {
      return super.cancelTimer();
    } finally {
      _$_CounterLayoutControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeNumPlayers(int newNumPLayers) {
    final _$actionInfo = _$_CounterLayoutControllerActionController.startAction(
        name: '_CounterLayoutController.changeNumPlayers');
    try {
      return super.changeNumPlayers(newNumPLayers);
    } finally {
      _$_CounterLayoutControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeStartingLifeTotal(int newLifeTotal) {
    final _$actionInfo = _$_CounterLayoutControllerActionController.startAction(
        name: '_CounterLayoutController.changeStartingLifeTotal');
    try {
      return super.changeStartingLifeTotal(newLifeTotal);
    } finally {
      _$_CounterLayoutControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLifeTotalSelected(int index) {
    final _$actionInfo = _$_CounterLayoutControllerActionController.startAction(
        name: '_CounterLayoutController.changeLifeTotalSelected');
    try {
      return super.changeLifeTotalSelected(index);
    } finally {
      _$_CounterLayoutControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nPlayers: ${nPlayers},
lifeTotal: ${lifeTotal},
lifeTotalIndex: ${lifeTotalIndex},
counters: ${counters},
showName: ${showName},
timerCount: ${timerCount},
isSearch: ${isSearch}
    ''';
  }
}
