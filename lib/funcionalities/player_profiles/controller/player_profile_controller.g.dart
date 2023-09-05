// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerProfilePageController on _PlayerProfilePageController, Store {
  late final _$listPlayerProfilesAtom = Atom(
      name: '_PlayerProfilePageController.listPlayerProfiles',
      context: context);

  @override
  ObservableList<PlayerModel> get listPlayerProfiles {
    _$listPlayerProfilesAtom.reportRead();
    return super.listPlayerProfiles;
  }

  @override
  set listPlayerProfiles(ObservableList<PlayerModel> value) {
    _$listPlayerProfilesAtom.reportWrite(value, super.listPlayerProfiles, () {
      super.listPlayerProfiles = value;
    });
  }

  late final _$loadStateAtom =
      Atom(name: '_PlayerProfilePageController.loadState', context: context);

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

  late final _$showTipAtom =
      Atom(name: '_PlayerProfilePageController.showTip', context: context);

  @override
  bool get showTip {
    _$showTipAtom.reportRead();
    return super.showTip;
  }

  @override
  set showTip(bool value) {
    _$showTipAtom.reportWrite(value, super.showTip, () {
      super.showTip = value;
    });
  }

  late final _$initialStateAsyncAction = AsyncAction(
      '_PlayerProfilePageController.initialState',
      context: context);

  @override
  Future<void> initialState() {
    return _$initialStateAsyncAction.run(() => super.initialState());
  }

  late final _$changeSelectedCardAsyncAction = AsyncAction(
      '_PlayerProfilePageController.changeSelectedCard',
      context: context);

  @override
  Future<void> changeSelectedCard(String id, CardModel cardSelected) {
    return _$changeSelectedCardAsyncAction
        .run(() => super.changeSelectedCard(id, cardSelected));
  }

  late final _$changeSelectedColorAsyncAction = AsyncAction(
      '_PlayerProfilePageController.changeSelectedColor',
      context: context);

  @override
  Future<void> changeSelectedColor(String id, Color colorSelected) {
    return _$changeSelectedColorAsyncAction
        .run(() => super.changeSelectedColor(id, colorSelected));
  }

  late final _$_PlayerProfilePageControllerActionController =
      ActionController(name: '_PlayerProfilePageController', context: context);

  @override
  void changeShowTip() {
    final _$actionInfo = _$_PlayerProfilePageControllerActionController
        .startAction(name: '_PlayerProfilePageController.changeShowTip');
    try {
      return super.changeShowTip();
    } finally {
      _$_PlayerProfilePageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoadState(LoadState state) {
    final _$actionInfo = _$_PlayerProfilePageControllerActionController
        .startAction(name: '_PlayerProfilePageController.changeLoadState');
    try {
      return super.changeLoadState(state);
    } finally {
      _$_PlayerProfilePageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listPlayerProfiles: ${listPlayerProfiles},
loadState: ${loadState},
showTip: ${showTip}
    ''';
  }
}
