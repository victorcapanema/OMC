// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_picker_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ColorPickerPageController on _ColorPickerPageController, Store {
  late final _$pickedColorAtom =
      Atom(name: '_ColorPickerPageController.pickedColor', context: context);

  @override
  Color get pickedColor {
    _$pickedColorAtom.reportRead();
    return super.pickedColor;
  }

  @override
  set pickedColor(Color value) {
    _$pickedColorAtom.reportWrite(value, super.pickedColor, () {
      super.pickedColor = value;
    });
  }

  late final _$_ColorPickerPageControllerActionController =
      ActionController(name: '_ColorPickerPageController', context: context);

  @override
  void changeColor(Color newColor) {
    final _$actionInfo = _$_ColorPickerPageControllerActionController
        .startAction(name: '_ColorPickerPageController.changeColor');
    try {
      return super.changeColor(newColor);
    } finally {
      _$_ColorPickerPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initialState(Color selectedColor) {
    final _$actionInfo = _$_ColorPickerPageControllerActionController
        .startAction(name: '_ColorPickerPageController.initialState');
    try {
      return super.initialState(selectedColor);
    } finally {
      _$_ColorPickerPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getRandomColor() {
    final _$actionInfo = _$_ColorPickerPageControllerActionController
        .startAction(name: '_ColorPickerPageController.getRandomColor');
    try {
      return super.getRandomColor();
    } finally {
      _$_ColorPickerPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pickedColor: ${pickedColor}
    ''';
  }
}
