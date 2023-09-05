// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_counter_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LifeCounterController on _LifeCounterController, Store {
  late final _$playerAtom =
      Atom(name: '_LifeCounterController.player', context: context);

  @override
  PlayerModel get player {
    _$playerAtom.reportRead();
    return super.player;
  }

  @override
  set player(PlayerModel value) {
    _$playerAtom.reportWrite(value, super.player, () {
      super.player = value;
    });
  }

  late final _$iconCountersAtom =
      Atom(name: '_LifeCounterController.iconCounters', context: context);

  @override
  ObservableList<CounterIcon> get iconCounters {
    _$iconCountersAtom.reportRead();
    return super.iconCounters;
  }

  @override
  set iconCounters(ObservableList<CounterIcon> value) {
    _$iconCountersAtom.reportWrite(value, super.iconCounters, () {
      super.iconCounters = value;
    });
  }

  late final _$playersCountersAtom =
      Atom(name: '_LifeCounterController.playersCounters', context: context);

  @override
  List<int> get playersCounters {
    _$playersCountersAtom.reportRead();
    return super.playersCounters;
  }

  @override
  set playersCounters(List<int> value) {
    _$playersCountersAtom.reportWrite(value, super.playersCounters, () {
      super.playersCounters = value;
    });
  }

  late final _$loadStateAtom =
      Atom(name: '_LifeCounterController.loadState', context: context);

  @override
  LoadState get loadState {
    _$loadStateAtom.reportRead();
    return super.loadState;
  }

  @override
  set loadState(LoadState value) {
    _$loadStateAtom.reportWrite(value, super.loadState, () {
      super.loadState = value;
    });
  }

  late final _$currentLifeAtom =
      Atom(name: '_LifeCounterController.currentLife', context: context);

  @override
  int get currentLife {
    _$currentLifeAtom.reportRead();
    return super.currentLife;
  }

  @override
  set currentLife(int value) {
    _$currentLifeAtom.reportWrite(value, super.currentLife, () {
      super.currentLife = value;
    });
  }

  late final _$lifeDifferenceAtom =
      Atom(name: '_LifeCounterController.lifeDifference', context: context);

  @override
  int get lifeDifference {
    _$lifeDifferenceAtom.reportRead();
    return super.lifeDifference;
  }

  @override
  set lifeDifference(int value) {
    _$lifeDifferenceAtom.reportWrite(value, super.lifeDifference, () {
      super.lifeDifference = value;
    });
  }

  late final _$showNameAtom =
      Atom(name: '_LifeCounterController.showName', context: context);

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

  late final _$getRandomCardAsyncAction =
      AsyncAction('_LifeCounterController.getRandomCard', context: context);

  @override
  Future<void> getRandomCard() {
    return _$getRandomCardAsyncAction.run(() => super.getRandomCard());
  }

  late final _$_LifeCounterControllerActionController =
      ActionController(name: '_LifeCounterController', context: context);

  @override
  void changePlayer(PlayerModel newPlayer) {
    final _$actionInfo = _$_LifeCounterControllerActionController.startAction(
        name: '_LifeCounterController.changePlayer');
    try {
      return super.changePlayer(newPlayer);
    } finally {
      _$_LifeCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCounter(bool isAdd) {
    final _$actionInfo = _$_LifeCounterControllerActionController.startAction(
        name: '_LifeCounterController.updateCounter');
    try {
      return super.updateCounter(isAdd);
    } finally {
      _$_LifeCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetLifeTotal() {
    final _$actionInfo = _$_LifeCounterControllerActionController.startAction(
        name: '_LifeCounterController.resetLifeTotal');
    try {
      return super.resetLifeTotal();
    } finally {
      _$_LifeCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetBackground() {
    final _$actionInfo = _$_LifeCounterControllerActionController.startAction(
        name: '_LifeCounterController.resetBackground');
    try {
      return super.resetBackground();
    } finally {
      _$_LifeCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPlayerCounters() {
    final _$actionInfo = _$_LifeCounterControllerActionController.startAction(
        name: '_LifeCounterController.resetPlayerCounters');
    try {
      return super.resetPlayerCounters();
    } finally {
      _$_LifeCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetAll() {
    final _$actionInfo = _$_LifeCounterControllerActionController.startAction(
        name: '_LifeCounterController.resetAll');
    try {
      return super.resetAll();
    } finally {
      _$_LifeCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoadState(LoadState state) {
    final _$actionInfo = _$_LifeCounterControllerActionController.startAction(
        name: '_LifeCounterController.changeLoadState');
    try {
      return super.changeLoadState(state);
    } finally {
      _$_LifeCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getRandomColor() {
    final _$actionInfo = _$_LifeCounterControllerActionController.startAction(
        name: '_LifeCounterController.getRandomColor');
    try {
      return super.getRandomColor();
    } finally {
      _$_LifeCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCount(int index) {
    final _$actionInfo = _$_LifeCounterControllerActionController.startAction(
        name: '_LifeCounterController.addCount');
    try {
      return super.addCount(index);
    } finally {
      _$_LifeCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void subCount(int index) {
    final _$actionInfo = _$_LifeCounterControllerActionController.startAction(
        name: '_LifeCounterController.subCount');
    try {
      return super.subCount(index);
    } finally {
      _$_LifeCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPlayerCount(int index) {
    final _$actionInfo = _$_LifeCounterControllerActionController.startAction(
        name: '_LifeCounterController.addPlayerCount');
    try {
      return super.addPlayerCount(index);
    } finally {
      _$_LifeCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void subPlayerCount(int index) {
    final _$actionInfo = _$_LifeCounterControllerActionController.startAction(
        name: '_LifeCounterController.subPlayerCount');
    try {
      return super.subPlayerCount(index);
    } finally {
      _$_LifeCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeShowName() {
    final _$actionInfo = _$_LifeCounterControllerActionController.startAction(
        name: '_LifeCounterController.changeShowName');
    try {
      return super.changeShowName();
    } finally {
      _$_LifeCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refreshWidget() {
    final _$actionInfo = _$_LifeCounterControllerActionController.startAction(
        name: '_LifeCounterController.refreshWidget');
    try {
      return super.refreshWidget();
    } finally {
      _$_LifeCounterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
player: ${player},
iconCounters: ${iconCounters},
playersCounters: ${playersCounters},
loadState: ${loadState},
currentLife: ${currentLife},
lifeDifference: ${lifeDifference},
showName: ${showName}
    ''';
  }
}
