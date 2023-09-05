import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../models/card_model.dart';
import '../../../models/player_model.dart';
import '../../../models/player_text_preferences_model.dart';
import '../../../repositories/storage_repository.dart';
import '../../../shared/app_colors.dart';

part 'player_edit_page_controller.g.dart';

class PlayerEditPageController = _PlayerEditPageController with _$PlayerEditPageController;

abstract class _PlayerEditPageController with Store {
  _PlayerEditPageController({required this.localStorage});

  final TextEditingController playerNameController = TextEditingController();
  final LocalStorage localStorage;

  PlayerModel playerModel = PlayerModel(
      id: '',
      playerName: 'Player Name',
      backgroundCards: [],
      backgroundColors: [],
      backgroundType: 2,
      selectedColor: AppColors.iceWhite,
      pLayerTextPreferences: PLayerTextPreferences(
        contrastValue: 10,
        fontSizeLife: 60,
        fontSizeIcons: 60,
        textColor: '2',
      ));

  @observable
  CardModel? selectedCard;

  @observable
  String image = '';

  @observable
  PLayerTextPreferences pLayerTextPreferences = PLayerTextPreferences(
    contrastValue: 10,
    fontSizeLife: 60,
    fontSizeIcons: 60,
    textColor: '1',
  );

  @observable
  Color selectedColor = AppColors.iceWhite;

  @action
  void changePlayer(PlayerModel player) {
    playerModel = player;
    selectedCard = playerModel.selectedCard;
    selectedColor = playerModel.selectedColor!;
    image = playerModel.selectedCard?.imageUris?.artCrop ?? '';
    pLayerTextPreferences = playerModel.pLayerTextPreferences;
  }

  @action
  void changeSelectedCard(CardModel newCard) {
    selectedCard = newCard;
    image = selectedCard?.imageUris?.artCrop ?? '';
    playerModel.backgroundType = 1;
    playerModel.selectedCard = newCard;
    playerModel.pLayerTextPreferences.textColor = '1';
  }

  @action
  void unselectCard() {
    selectedCard = null;
    image = '';
    playerModel.backgroundType = 2;
    playerModel.selectedCard = null;
    playerModel.pLayerTextPreferences.textColor = '2';
  }

  @action
  void changeSelectedColor(Color newColor) {
    selectedColor = newColor;
    playerModel.selectedColor = newColor;
    playerModel.backgroundType = 2;
    playerModel.pLayerTextPreferences.textColor = '2';
  }

  @action
  void initialState(PlayerModel player) {
    playerModel = player;
    playerNameController.text = playerModel.playerName;
    playerModel.selectedCard != null ? image = playerModel.selectedCard!.imageUris!.artCrop! ?? '' : image = '';
    selectedCard = playerModel.selectedCard;
    selectedColor = playerModel.selectedColor ?? Colors.grey;
    pLayerTextPreferences = playerModel.pLayerTextPreferences;
  }

  void changeContrastValue(double value) {
    getNewPLayerTextPreferences(value, null, null, null);
  }

  void changeFontSizeLife(double value) {
    getNewPLayerTextPreferences(null, value, null, null);
  }

  void changeFontSizeIcons(double value) {
    getNewPLayerTextPreferences(null, null, value, null);
  }

  void changeSelectedTextColor(String color) {
    getNewPLayerTextPreferences(null, null, null, color);
  }

  @action
  void getNewPLayerTextPreferences(
      double? contrastValue, double? fontSizeLife, double? fontSizeIcons, String? textColor) {
    pLayerTextPreferences = PLayerTextPreferences(
      contrastValue: contrastValue ?? pLayerTextPreferences.contrastValue,
      fontSizeLife: fontSizeLife ?? pLayerTextPreferences.fontSizeLife,
      fontSizeIcons: fontSizeIcons ?? pLayerTextPreferences.fontSizeIcons,
      textColor: textColor ?? pLayerTextPreferences.textColor,
    );
    playerModel.pLayerTextPreferences = pLayerTextPreferences;
  }

  bool isAdd() {
    bool isAdd = true;

    if (playerModel.selectedCard != null) {
      for (var i in playerModel.backgroundCards) {
        if (i.id == playerModel.selectedCard?.id) {
          isAdd = false;
          break;
        }
      }
    } else {
      isAdd = false;
    }

    isAdd ? playerModel.backgroundCards.add(playerModel.selectedCard!) : null;

    isAdd = true;

    if (playerModel.selectedColor != null) {
      for (var i in playerModel.backgroundColors) {
        if (i == playerModel.selectedColor) {
          isAdd = false;
          break;
        }
      }
    } else {
      isAdd = false;
    }

    isAdd ? playerModel.backgroundColors.add(playerModel.selectedColor!) : null;
    return true;
  }

  Future<void> savePlayer() async {
    await isAdd();

    playerModel.id == ''
        ? await localStorage.saveNewProfile(playerModel)
        : await localStorage.updateProfile(playerModel);
  }

  @action
  void newPlayer() {
    playerModel = PlayerModel(
        id: '',
        playerName: 'Player Name',
        backgroundCards: [],
        backgroundColors: [],
        backgroundType: 2,
        selectedColor: AppColors.iceWhite,
        pLayerTextPreferences: PLayerTextPreferences(
          contrastValue: 10,
          fontSizeLife: 60,
          fontSizeIcons: 60,
          textColor: '2',
        ));

    initialState(playerModel);
  }

  Future<void> findProfile() async {
    if (playerModel.id != '' && !await localStorage.profileExists(playerModel.id)) {
      newPlayer();
    }
  }
}
