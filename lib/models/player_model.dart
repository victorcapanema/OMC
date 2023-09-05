import 'package:life_counter/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:life_counter/models/player_text_preferences_model.dart';

class PlayerModel {
  String id;
  String playerName;
  int? backgroundType;
  CardModel? selectedCard;
  Color? selectedColor;
  List<CardModel> backgroundCards;
  List<Color> backgroundColors;
  PLayerTextPreferences pLayerTextPreferences;

  PlayerModel({
    required this.id,
    required this.playerName,
    required this.pLayerTextPreferences,
    required this.backgroundCards,
    required this.backgroundColors,
    this.backgroundType,
    this.selectedColor,
    this.selectedCard,
  });

  @override
  String toString() {
    return 'id: $id, playerName: $playerName, backgroundType: $backgroundType, selectedCard: ${selectedCard.toString()}, selectedColor: $selectedColor, backgroundColors $backgroundColors, backgroundCards $backgroundCards ';
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "playerName": playerName,
        "backgroundType": backgroundType,
        "backgroundCards": backgroundCards.map((e) => e.toJson()).toList(),
        "backgroundColors": backgroundColors.map((e) => e.toString()).toList(),
        "selectedCard": selectedCard?.toJson(),
        "pLayerTextPreferences": pLayerTextPreferences.toJson(),
        "selectedColor": selectedColor.toString(),
      };

  PlayerModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        playerName = json['playerName'],
        backgroundType = json['backgroundType'],
        selectedColor = json['selectedColor'] != null
            ? Color(int.parse((json['selectedColor'] as String).replaceAll('Color(', '').replaceAll(')', '')))
            : null,
        selectedCard = json['selectedCard'] != null ? CardModel.fromJson(json['selectedCard']) : null,
        pLayerTextPreferences = PLayerTextPreferences.fromJson(json['pLayerTextPreferences']),
        backgroundCards = List<CardModel>.from(json['backgroundCards'].map((model) => CardModel.fromJson(model))),
        backgroundColors = List<Color>.from(json['backgroundColors']
            .map((e) => Color(int.parse((e as String).replaceAll('Color(', '').replaceAll(')', ''))))
            .toList());
}
