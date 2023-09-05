import '../constants.dart';

double getAspectRatio(int index, double height, double width) {
  bool isEven = globalNumPlayers % 2 == 0;
  if (isEven) {
    if (globalNumPlayers == 2) {
      return width / (height / 2);
    } else {
      return (width / 2) / (height / (globalNumPlayers / 2));
    }
  } else {
    if (index == 6) {
      return (width / (height / ((globalNumPlayers + 1) / 2)));
    } else {
      return (width / 2) / (height / ((globalNumPlayers + 1) / 2));
    }
  }
}