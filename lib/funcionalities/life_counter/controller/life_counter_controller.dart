import 'dart:async';
import 'dart:math' as math;
import 'package:dartz/dartz.dart';
import 'package:life_counter/models/player_model.dart';
import 'package:mobx/mobx.dart';
import '../../../models/card_model.dart';
import '../../../models/player_text_preferences_model.dart';
import '../../../repositories/scryfall_repository.dart';
import '../../../shared/app_colors.dart';
import '../../../shared/classes.dart';
import '../../../shared/constants.dart';
import 'package:flutter/material.dart';

part 'life_counter_controller.g.dart';

class LifeCounterController = _LifeCounterController with _$LifeCounterController;

abstract class _LifeCounterController with Store {
  _LifeCounterController({required this.scryFallRepository, required this.refreshAll});

  final ScryFallRepository scryFallRepository;
  final void Function() refreshAll;

  late Either<List<CardModel>, String> resp;

  @observable
  PlayerModel player = PlayerModel(
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
  ObservableList<CounterIcon> iconCounters = ObservableList<CounterIcon>.of([
    CounterIcon(iconPath: "images/ability-defender.svg", name: 'C. Tax', count: 0),
    CounterIcon(iconPath: "images/instant.svg", name: 'Energy', count: 0),
    CounterIcon(iconPath: "images/loyalty-start.svg", name: 'Exp', count: 0),
    CounterIcon(iconPath: "images/p.svg", name: 'Poison', count: 0),
  ]);

  @observable
  List<int> playersCounters = [0, 0, 0, 0, 0, 0, 0];

  @observable
  LoadState loadState = LoadState.success;

  @observable
  int currentLife = globalLifePoints;

  @observable
  int lifeDifference = 0;

  @observable
  bool showName = true;

  Timer? timer;
  Timer? resetTimer;

  int oldLife = globalLifePoints;

  int? playerId;

  List<int> counterHistory = [];

  void initState(int id) {
    playerId ??= id;
    player.playerName = player.playerName == 'Player Name' ? 'Player $playerId' : player.playerName;
  }

  @action
  void changePlayer(PlayerModel newPlayer) {
    player = PlayerModel(
        id: newPlayer.id,
        playerName: newPlayer.playerName,
        selectedColor: newPlayer.selectedColor,
        backgroundCards: newPlayer.backgroundCards,
        backgroundType: newPlayer.backgroundType,
        selectedCard: newPlayer.selectedCard,
        pLayerTextPreferences: newPlayer.pLayerTextPreferences,
        backgroundColors: newPlayer.backgroundColors);
  }

  @action
  void updateCounter(bool isAdd) {
    if (resetTimer != null) {
      resetTimer?.cancel();
    }
    oldLife = currentLife;

    timer = Timer.periodic(const Duration(milliseconds: 600), (t) {
      oldLife = currentLife;
      isAdd ? currentLife += 10 : currentLife -= 10;

      lifeDifference = lifeDifference + (currentLife - oldLife);
    });
  }

  void cancelTimer(bool isAdd) {
    if (timer != null) {
      timer?.cancel();
    }
    if (oldLife == currentLife) {
      isAdd ? currentLife++ : currentLife--;
      lifeDifference = lifeDifference + currentLife - oldLife;
    }
    resetDifference();
  }

  void resetDifference() {
    resetTimer = Timer.periodic(const Duration(milliseconds: 3500), (t) {
      lifeDifference != 0 ? counterHistory.add(lifeDifference) : null;
      lifeDifference = 0;
      resetTimer?.cancel();
    });
  }

  @action
  void resetLifeTotal() {
    counterHistory = [];
    currentLife = globalLifePoints;
    oldLife = globalLifePoints;
  }

  @action
  void resetBackground() {
    PlayerModel playerAux = player;
    player = PlayerModel(
        id: '',
        playerName: playerAux.playerName,
        backgroundCards: [],
        backgroundType: 2,
        selectedColor: AppColors.iceWhite,
        pLayerTextPreferences: playerAux.pLayerTextPreferences,
        backgroundColors: []);
  }

  @action
  void resetPlayerCounters() {
    for (var item in iconCounters) {
      item.count = 0;
    }
    for (int i = 0; i < 6; i++) {
      playersCounters[i] = 0;
    }
    iconCounters = ObservableList<CounterIcon>.of(iconCounters.toList());
  }

  @action
  void resetAll() {
    counterHistory = [];
    currentLife = globalLifePoints;
    oldLife = globalLifePoints;
    player = PlayerModel(
        id: '',
        playerName: 'Player $playerId',
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
    for (var item in iconCounters) {
      item.count = 0;
    }
    for (int i = 0; i < 6; i++) {
      playersCounters[i] = 0;
    }
  }

  @action
  void changeLoadState(LoadState state) {
    loadState = state;
  }

  @action
  Future<void> getRandomCard() async {
    changeLoadState(LoadState.loading);
    try {
      resp = await scryFallRepository.getRandomCard();

      resp.fold(
          (l) => {
                player.backgroundType = 1,
                player.selectedCard = l.first,
              },
          (r) => {
                player.backgroundType = 1,
                player.selectedCard = auxCard,
              });
      player.pLayerTextPreferences.textColor = '1';
    } on Exception {
      player.backgroundType = 1;
      player.selectedCard = auxCard;
    }
    changeLoadState(LoadState.success);
  }

  @action
  void getRandomColor() {
    changeLoadState(LoadState.loading);
    player.backgroundType = 2;
    player.selectedColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1);
    changeLoadState(LoadState.success);
  }

  @action
  void addCount(int index) {
    iconCounters[index].count++;
    refreshWidget();
  }

  @action
  void subCount(int index) {
    iconCounters[index].count--;
    refreshWidget();
  }

  @action
  void addPlayerCount(int index) {
    playersCounters[index]++;
    refreshWidget();
  }

  @action
  void subPlayerCount(int index) {
    playersCounters[index]--;
    refreshWidget();
  }

  @action
  void changeShowName() {
    showName = !showName;
    refreshWidget();
  }

  @action
  void refreshWidget() {
    iconCounters = ObservableList<CounterIcon>.of(iconCounters.toList());
  }
}
