import 'dart:ui';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../models/card_model.dart';
import '../../../models/player_model.dart';
import '../../../models/player_text_preferences_model.dart';
import '../../../repositories/storage_repository.dart';
import '../../../shared/app_colors.dart';
import '../../../shared/constants.dart';

part 'player_profile_controller.g.dart';

class PlayerProfilePageController = _PlayerProfilePageController with _$PlayerProfilePageController;

abstract class _PlayerProfilePageController with Store {
  _PlayerProfilePageController({required this.localStorage});

  final LocalStorage localStorage;

  @observable
  ObservableList<PlayerModel> listPlayerProfiles = ObservableList<PlayerModel>.of([]);

  @observable
  late LoadState loadState = LoadState.success;

  @observable
  bool showTip = false;

  @action
  void changeShowTip() {
    showTip = !showTip;
  }

  @action
  void changeLoadState(LoadState state) {
    loadState = state;
  }

  Future<void> loadProfiles() async {
    List<PlayerModel> auxList = await localStorage.getListProfiles();
    listPlayerProfiles = ObservableList<PlayerModel>.of([]);
    for (var i in auxList) {
      listPlayerProfiles.add(i);
    }
  }

  @action
  Future<void> initialState() async {
    changeLoadState(LoadState.loading);
    await loadProfiles();
    changeLoadState(LoadState.success);
  }

  Future<void> deleteAll() async {
    await localStorage.deleteAll();
    initialState();
  }

  Future<void> deleteProfile(String id) async {
    await localStorage.deleteProfile(id);
    initialState();
  }

  @action
  Future<void> changeSelectedCard(String id, CardModel cardSelected) async {
    listPlayerProfiles[listPlayerProfiles.indexWhere((e) => e.id == id)].selectedCard = cardSelected;
    listPlayerProfiles[listPlayerProfiles.indexWhere((e) => e.id == id)].backgroundType = 1;
    refreshWidget();
  }

  @action
  Future<void> changeSelectedColor(String id, Color colorSelected) async {
    listPlayerProfiles[listPlayerProfiles.indexWhere((e) => e.id == id)].selectedColor = colorSelected;
    listPlayerProfiles[listPlayerProfiles.indexWhere((e) => e.id == id)].backgroundType = 2;
    refreshWidget();
  }

  void refreshWidget() {
    listPlayerProfiles = ObservableList<PlayerModel>.of(listPlayerProfiles.toList());
  }

  PlayerModel newPlayer = PlayerModel(
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
}
