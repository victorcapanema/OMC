import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../shared/constants.dart';

part 'counter_layout_controller.g.dart';

class CounterLayoutController = _CounterLayoutController with _$CounterLayoutController;

abstract class _CounterLayoutController with Store {
  final TextEditingController customLifeController = TextEditingController(text: '60');

  @observable
  int nPlayers = globalNumPlayers;

  @observable
  int lifeTotal = 20;

  @observable
  int lifeTotalIndex = 0;

  @observable
  ObservableList<int> counters = ObservableList<int>.of([0, 0, 0, 0, 0, 0, 0]);

  @observable
  bool showName = true;

  @observable
  int timerCount = 5;

  @observable
  bool isSearch = true;

  String payersTextColor = '2';

  Timer? timer;

  @action
  void startCounter() {
    isSearch = false;
    timer = Timer.periodic(const Duration(milliseconds: 1000), (t) {
      updateCounter();
      if (timerCount == 0) {
        cancelTimer();
      }
    });
  }

  @action
  void updateCounter() {
    timerCount--;
  }

  @action
  void cancelTimer() {
    if (timer != null) {
      timer?.cancel();
      timerCount = 5;
      isSearch = true;
    }
  }

  @action
  void changeNumPlayers(int newNumPLayers) {
    nPlayers = newNumPLayers;
    globalNumPlayers = newNumPLayers;
    refreshAllPlayers();
  }

  @action
  void changeStartingLifeTotal(int newLifeTotal) {
    lifeTotal = newLifeTotal;
    globalLifePoints = newLifeTotal;
  }

  @action
  void changeLifeTotalSelected(int index) {
    lifeTotalIndex = index;
  }

  void resetPLayersLifeTotal() {
    for (var i in listCounters) {
      i.lifeCounterController.resetLifeTotal();
    }
  }

  void resetPLayersBackground() {
    for (var i in listCounters) {
      i.lifeCounterController.resetBackground();
    }
  }

  void resetPLayersCounters() {
    for (var i in listCounters) {
      i.lifeCounterController.resetPlayerCounters();
    }
  }

  void resetAllPlayers() {
    for (var i in listCounters) {
      i.lifeCounterController.resetAll();
    }
  }

  void randomColorBackground() {
    for (var i in listCounters) {
      i.lifeCounterController.getRandomColor();
    }
  }

  void changeNameStatus() {
    showName = !showName;
    for (var i in listCounters) {
      i.lifeCounterController.changeShowName();
    }
  }

  void changePlayersFontColors() {
    payersTextColor = payersTextColor == '1' ? '2' : '1';
    for (var i in listCounters) {
      i.lifeCounterController.player.pLayerTextPreferences.textColor = payersTextColor;
      refreshAllPlayers();
    }
  }

  Future<void> randomBackground() async {
    if (isSearch) {
      startCounter();
      for (int i = 0; i < globalNumPlayers; i++) {
        await Future.delayed(const Duration(milliseconds: 200));
        listCounters[i].lifeCounterController.getRandomCard();
      }
    }
  }

  void refreshAllPlayers() {
    for (var i in listCounters) {
      i.lifeCounterController.refreshWidget();
    }
  }
}
