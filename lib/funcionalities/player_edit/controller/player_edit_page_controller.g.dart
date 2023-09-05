// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_edit_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerEditPageController on _PlayerEditPageController, Store {
  late final _$selectedCardAtom =
      Atom(name: '_PlayerEditPageController.selectedCard', context: context);

  @override
  CardModel? get selectedCard {
    _$selectedCardAtom.reportRead();
    return super.selectedCard;
  }

  @override
  set selectedCard(CardModel? value) {
    _$selectedCardAtom.reportWrite(value, super.selectedCard, () {
      super.selectedCard = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_PlayerEditPageController.image', context: context);

  @override
  String get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$pLayerTextPreferencesAtom = Atom(
      name: '_PlayerEditPageController.pLayerTextPreferences',
      context: context);

  @override
  PLayerTextPreferences get pLayerTextPreferences {
    _$pLayerTextPreferencesAtom.reportRead();
    return super.pLayerTextPreferences;
  }

  @override
  set pLayerTextPreferences(PLayerTextPreferences value) {
    _$pLayerTextPreferencesAtom.reportWrite(value, super.pLayerTextPreferences,
        () {
      super.pLayerTextPreferences = value;
    });
  }

  late final _$selectedColorAtom =
      Atom(name: '_PlayerEditPageController.selectedColor', context: context);

  @override
  Color get selectedColor {
    _$selectedColorAtom.reportRead();
    return super.selectedColor;
  }

  @override
  set selectedColor(Color value) {
    _$selectedColorAtom.reportWrite(value, super.selectedColor, () {
      super.selectedColor = value;
    });
  }

  late final _$_PlayerEditPageControllerActionController =
      ActionController(name: '_PlayerEditPageController', context: context);

  @override
  void changePlayer(PlayerModel player) {
    final _$actionInfo = _$_PlayerEditPageControllerActionController
        .startAction(name: '_PlayerEditPageController.changePlayer');
    try {
      return super.changePlayer(player);
    } finally {
      _$_PlayerEditPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectedCard(CardModel newCard) {
    final _$actionInfo = _$_PlayerEditPageControllerActionController
        .startAction(name: '_PlayerEditPageController.changeSelectedCard');
    try {
      return super.changeSelectedCard(newCard);
    } finally {
      _$_PlayerEditPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselectCard() {
    final _$actionInfo = _$_PlayerEditPageControllerActionController
        .startAction(name: '_PlayerEditPageController.unselectCard');
    try {
      return super.unselectCard();
    } finally {
      _$_PlayerEditPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectedColor(Color newColor) {
    final _$actionInfo = _$_PlayerEditPageControllerActionController
        .startAction(name: '_PlayerEditPageController.changeSelectedColor');
    try {
      return super.changeSelectedColor(newColor);
    } finally {
      _$_PlayerEditPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initialState(PlayerModel player) {
    final _$actionInfo = _$_PlayerEditPageControllerActionController
        .startAction(name: '_PlayerEditPageController.initialState');
    try {
      return super.initialState(player);
    } finally {
      _$_PlayerEditPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getNewPLayerTextPreferences(double? contrastValue, double? fontSizeLife,
      double? fontSizeIcons, String? textColor) {
    final _$actionInfo =
        _$_PlayerEditPageControllerActionController.startAction(
            name: '_PlayerEditPageController.getNewPLayerTextPreferences');
    try {
      return super.getNewPLayerTextPreferences(
          contrastValue, fontSizeLife, fontSizeIcons, textColor);
    } finally {
      _$_PlayerEditPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void newPlayer() {
    final _$actionInfo = _$_PlayerEditPageControllerActionController
        .startAction(name: '_PlayerEditPageController.newPlayer');
    try {
      return super.newPlayer();
    } finally {
      _$_PlayerEditPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCard: ${selectedCard},
image: ${image},
pLayerTextPreferences: ${pLayerTextPreferences},
selectedColor: ${selectedColor}
    ''';
  }
}
