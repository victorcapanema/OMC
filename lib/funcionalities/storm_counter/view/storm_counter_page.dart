import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/app_colors.dart';
import '../../../shared/constants.dart';
import '../../../widgets/modal_screen.dart';
import '../controller/storm_counter_controller.dart';

class StormCounterPage extends StatefulWidget {
  const StormCounterPage({super.key});

  @override
  State<StormCounterPage> createState() => _StormCounterPageState();
}

class _StormCounterPageState extends State<StormCounterPage> {
  final stormCounterController = Modular.get<StormCounterController>();

  @override
  Widget build(BuildContext context) {
    return ModalPage(
      isCenter: true,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Observer(
        builder: (_) => SingleChildScrollView(
          child: Stack(children: [
            Positioned(
                top: 6,
                right: 6,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.close, color: AppColors.grey),
                  onPressed: () {
                    Modular.to.pop();
                  },
                )),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Storm & Mana',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                const SizedBox(height: 4),
                for (int x = 0; x <= 6; x++) customRow(x),
                const SizedBox(height: 30),
                const Center(
                    child: Text('Vectors by Andrew Gioia', style: TextStyle(color: AppColors.grey, fontSize: 10))),
                const Center(
                    child: Text('All mana images and card symbols © Wizards of the Coast',
                        style: TextStyle(color: AppColors.grey, fontSize: 10))),
                const SizedBox(height: 4),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget customRow(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          InkWell(
              onTapUp: (_) => stormCounterController.cancelTimer(false, index),
              onTapCancel: () => stormCounterController.cancelTimer(false, index),
              onTapDown: (_) => stormCounterController.updateCounter(false, index),
              child: const Icon(Icons.remove, color: Colors.grey)),
          const SizedBox(width: 10),
          InkWell(
              onTapUp: (_) => stormCounterController.cancelTimer(true, index),
              onTapCancel: () => stormCounterController.cancelTimer(true, index),
              onTapDown: (_) => stormCounterController.updateCounter(true, index),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: AppColors.lightGrey,
                      ),
                      shape: BoxShape.circle,
                      color: AppColors.darkGrey),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: manaSymbols[index],
                  ))),
          const SizedBox(width: 10),
          Text(stormCounterController.counters[index].toString(),
              style: const TextStyle(color: Colors.grey, fontSize: 20)),
          const Spacer(),
          IconButton(
              onPressed: () {
                stormCounterController.clearCounter(index);
              },
              icon: const Icon(Icons.delete_outline, color: Colors.grey)),
        ],
      ),
    );
  }
}
