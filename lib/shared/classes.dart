import '../models/player_model.dart';

class CounterIcon {
  String iconPath;
  String name;
  int count;

  CounterIcon({required this.iconPath, required this.name, required this.count});
}

class PlayerCounterIcon {
  PlayerModel player;
  int count;

  PlayerCounterIcon({required this.player, required this.count});
}