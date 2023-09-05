import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'dart:math' as math;
part 'color_picker_controller.g.dart';

class ColorPickerPageController = _ColorPickerPageController with _$ColorPickerPageController;

abstract class _ColorPickerPageController with Store {

  @observable
  Color pickedColor = Colors.green;

  @action
  void changeColor(Color newColor) {
    pickedColor = newColor;
  }

  @action
  void initialState(Color selectedColor) {
    pickedColor = selectedColor;
  }

  @action
  void getRandomColor() {
    changeColor(Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));
  }

}
