import '../constants.dart';

double getTouchSize(int index, double height, double width, int mode) {
  //Mode 1:height , 2:width
  int numPLayer = globalNumPlayers;
  if (numPLayer % 2 != 0) {
    numPLayer++;
  }
  if (globalNumPlayers > 2 &&
      ((index != 3 && index != 5 || globalNumPlayers % 2 == 0))) {
    return mode == 1 ? width / 2 : (height / numPLayer);
  } else if (globalNumPlayers == 2) {
    return mode == 1 ? height / 2 : width / numPLayer;
  } else if (index == 3) {
    if (globalNumPlayers == 3) {
      return mode == 1 ? (height / 2) : width / 2;
    } else {
      return mode == 1 ? width / 2 : (height / numPLayer);
    }
  } else if (globalNumPlayers == 5) {
    return mode == 1 ? (height * (1 / 3)) : width / 2;
  } else {
    return mode == 1 ? height : width / 2;
  }
}
