import 'dart:async';
import 'package:mobx/mobx.dart';

part 'storm_counter_controller.g.dart';

class StormCounterController = _StormCounterController with _$StormCounterController;

abstract class _StormCounterController with Store {
  @observable
  ObservableList<int> counters = ObservableList<int>.of([0, 0, 0, 0, 0, 0, 0]);

  Timer? timer;
  int oldValue = 0;

  @action
  void clearCounter(int index) {
    counters[index] = 0;
  }

  @action
  void updateCounter(bool isAdd, int index) {
    oldValue = counters[index];

    timer = Timer.periodic(const Duration(milliseconds: 600), (t) {
      isAdd ? counters[index] += 10 : counters[index] -= 10;
    });
  }

  void cancelTimer(bool isAdd, int index) {
    if (timer != null) {
      timer?.cancel();
    }
    if (oldValue == counters[index]) {
      isAdd ? counters[index]++ : counters[index]--;
    }
  }
}
