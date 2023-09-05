import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'dice_roll_controller.g.dart';

class DiceRollController = _DiceRollController with _$DiceRollController;

abstract class _DiceRollController with Store {

  final TextEditingController customSideController = TextEditingController(text: '50');

  List<int> diceOptions = [2, 4, 6, 8, 10, 12, 20, 50];

  Timer? timer;

  @observable
  bool showNumber = false;

  @observable
  int randomNumber = 1;

  @observable
  int diceSides = 20;

  @action
  void updateCounter() {
    timer = Timer.periodic(const Duration(milliseconds: 2500), (t) {
      cancelTimer();
    });
  }

  @action
  void cancelTimer() {
    if (timer != null) {
      showNumber = false;
      timer?.cancel();
    }
  }

  @action
  void changeShowNumber() {
    showNumber = true;
  }

  @action
  void generateRandomNumber() {
    randomNumber = Random().nextInt(diceSides) + 1;
  }

  @action
  void changeSizeNumber(int nSides) {
    diceSides = nSides;
  }

  void changeCustomSides(int nSides) {
    diceOptions[7] = nSides;
  }
}
