// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dice_roll_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DiceRollController on _DiceRollController, Store {
  late final _$showNumberAtom =
      Atom(name: '_DiceRollController.showNumber', context: context);

  @override
  bool get showNumber {
    _$showNumberAtom.reportRead();
    return super.showNumber;
  }

  @override
  set showNumber(bool value) {
    _$showNumberAtom.reportWrite(value, super.showNumber, () {
      super.showNumber = value;
    });
  }

  late final _$randomNumberAtom =
      Atom(name: '_DiceRollController.randomNumber', context: context);

  @override
  int get randomNumber {
    _$randomNumberAtom.reportRead();
    return super.randomNumber;
  }

  @override
  set randomNumber(int value) {
    _$randomNumberAtom.reportWrite(value, super.randomNumber, () {
      super.randomNumber = value;
    });
  }

  late final _$diceSidesAtom =
      Atom(name: '_DiceRollController.diceSides', context: context);

  @override
  int get diceSides {
    _$diceSidesAtom.reportRead();
    return super.diceSides;
  }

  @override
  set diceSides(int value) {
    _$diceSidesAtom.reportWrite(value, super.diceSides, () {
      super.diceSides = value;
    });
  }

  late final _$_DiceRollControllerActionController =
      ActionController(name: '_DiceRollController', context: context);

  @override
  void updateCounter() {
    final _$actionInfo = _$_DiceRollControllerActionController.startAction(
        name: '_DiceRollController.updateCounter');
    try {
      return super.updateCounter();
    } finally {
      _$_DiceRollControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancelTimer() {
    final _$actionInfo = _$_DiceRollControllerActionController.startAction(
        name: '_DiceRollController.cancelTimer');
    try {
      return super.cancelTimer();
    } finally {
      _$_DiceRollControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeShowNumber() {
    final _$actionInfo = _$_DiceRollControllerActionController.startAction(
        name: '_DiceRollController.changeShowNumber');
    try {
      return super.changeShowNumber();
    } finally {
      _$_DiceRollControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void generateRandomNumber() {
    final _$actionInfo = _$_DiceRollControllerActionController.startAction(
        name: '_DiceRollController.generateRandomNumber');
    try {
      return super.generateRandomNumber();
    } finally {
      _$_DiceRollControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSizeNumber(int nSides) {
    final _$actionInfo = _$_DiceRollControllerActionController.startAction(
        name: '_DiceRollController.changeSizeNumber');
    try {
      return super.changeSizeNumber(nSides);
    } finally {
      _$_DiceRollControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showNumber: ${showNumber},
randomNumber: ${randomNumber},
diceSides: ${diceSides}
    ''';
  }
}
