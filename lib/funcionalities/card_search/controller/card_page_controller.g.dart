// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardPageController on _CardPageController, Store {
  late final _$cardListAtom =
      Atom(name: '_CardPageController.cardList', context: context);

  @override
  List<CardModel> get cardList {
    _$cardListAtom.reportRead();
    return super.cardList;
  }

  @override
  set cardList(List<CardModel> value) {
    _$cardListAtom.reportWrite(value, super.cardList, () {
      super.cardList = value;
    });
  }

  late final _$loadStateAtom =
      Atom(name: '_CardPageController.loadState', context: context);

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

  late final _$timerCountAtom =
      Atom(name: '_CardPageController.timerCount', context: context);

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
      Atom(name: '_CardPageController.isSearch', context: context);

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

  late final _$searchCardsAsyncAction =
      AsyncAction('_CardPageController.searchCards', context: context);

  @override
  Future<void> searchCards() {
    return _$searchCardsAsyncAction.run(() => super.searchCards());
  }

  late final _$getRandomCardAsyncAction =
      AsyncAction('_CardPageController.getRandomCard', context: context);

  @override
  Future<void> getRandomCard() {
    return _$getRandomCardAsyncAction.run(() => super.getRandomCard());
  }

  late final _$_CardPageControllerActionController =
      ActionController(name: '_CardPageController', context: context);

  @override
  void changeLoadState(LoadState state) {
    final _$actionInfo = _$_CardPageControllerActionController.startAction(
        name: '_CardPageController.changeLoadState');
    try {
      return super.changeLoadState(state);
    } finally {
      _$_CardPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initialState(CardModel? card) {
    final _$actionInfo = _$_CardPageControllerActionController.startAction(
        name: '_CardPageController.initialState');
    try {
      return super.initialState(card);
    } finally {
      _$_CardPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void backToTop() {
    final _$actionInfo = _$_CardPageControllerActionController.startAction(
        name: '_CardPageController.backToTop');
    try {
      return super.backToTop();
    } finally {
      _$_CardPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearList() {
    final _$actionInfo = _$_CardPageControllerActionController.startAction(
        name: '_CardPageController.clearList');
    try {
      return super.clearList();
    } finally {
      _$_CardPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startCounter() {
    final _$actionInfo = _$_CardPageControllerActionController.startAction(
        name: '_CardPageController.startCounter');
    try {
      return super.startCounter();
    } finally {
      _$_CardPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCounter() {
    final _$actionInfo = _$_CardPageControllerActionController.startAction(
        name: '_CardPageController.updateCounter');
    try {
      return super.updateCounter();
    } finally {
      _$_CardPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancelTimer() {
    final _$actionInfo = _$_CardPageControllerActionController.startAction(
        name: '_CardPageController.cancelTimer');
    try {
      return super.cancelTimer();
    } finally {
      _$_CardPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardList: ${cardList},
loadState: ${loadState},
timerCount: ${timerCount},
isSearch: ${isSearch}
    ''';
  }
}
