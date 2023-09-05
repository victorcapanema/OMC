import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:life_counter/widgets/custom_buttom.dart';
import 'package:life_counter/widgets/modal_screen.dart';
import 'package:lottie/lottie.dart';
import '../../../shared/app_colors.dart';
import '../../../widgets/custom_svg.dart';
import '../controller/dice_roll_controller.dart';

class DiceRollPage extends StatefulWidget {
  const DiceRollPage({super.key});

  @override
  State<DiceRollPage> createState() => _DiceRollPageState();
}

class _DiceRollPageState extends State<DiceRollPage> with SingleTickerProviderStateMixin {
  DiceRollController diceRollController = Modular.get<DiceRollController>();

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ModalPage(
      isCenter: true,
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text('Choose the number of sides to roll', style: TextStyle(color: AppColors.grey)),
                const SizedBox(height: 16),
                CSvg("images/d20.svg", color: AppColors.grey),
                const SizedBox(height: 16),
                Wrap(
                  children: [
                    for (var i = 0; i <= 7; i++)
                      i < 7
                          ? CustomButton(
                              text: diceRollController.diceOptions[i].toString(),
                              onPressed: () {
                                diceRollController.changeSizeNumber(diceRollController.diceOptions[i]);
                              },
                              backgroundColor: diceRollController.diceOptions[i] == diceRollController.diceSides
                                  ? AppColors.darkGrey
                                  : Colors.transparent)
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(4, 6, 0, 0),
                              child: Container(
                                height: 35,
                                width: 55,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, // the thickness
                                      color: AppColors.lightGrey),
                                  color: diceRollController.customSideController.text.isNotEmpty &&
                                          diceRollController.diceOptions[i] == diceRollController.diceSides
                                      ? AppColors.darkGrey
                                      : Colors.black.withOpacity(0.35),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: TextFormField(
                                  controller: diceRollController.customSideController,
                                  onEditingComplete: () {
                                    diceRollController
                                        .changeSizeNumber(int.parse(diceRollController.customSideController.text));
                                    diceRollController
                                        .changeCustomSides(int.parse(diceRollController.customSideController.text));
                                  },
                                  onFieldSubmitted: (text) {
                                    diceRollController
                                        .changeSizeNumber(int.parse(diceRollController.customSideController.text));
                                    diceRollController
                                        .changeCustomSides(int.parse(diceRollController.customSideController.text));
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  },
                                  style:
                                      const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(width: 1, color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(40)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(width: 1, color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(40)),
                                  ),
                                ),
                              ),
                            ),
                  ],
                ),
                Stack(
                  children: [
                    Lottie.asset('images/dice.json', controller: _controller),
                    Positioned(
                      left: 35,
                      bottom: 25,
                      child: Visibility(
                        visible: diceRollController.showNumber,
                        child: Text(
                          diceRollController.randomNumber.toString(),
                          style: const TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                        fontSize: 15,
                        backgroundColor: AppColors.grey,
                        textColor: Colors.black,
                        onPressed: () {
                          Modular.to.pop();
                        },
                        text: 'Back'),
                    const SizedBox(width: 40),
                    CustomButton(
                        fontSize: 15,
                        backgroundColor: AppColors.grey,
                        textColor: Colors.black,
                        onPressed: () {
                          diceRollController.cancelTimer();
                          _controller.reset();
                          _controller.forward().whenComplete(() => {
                                diceRollController.generateRandomNumber(),
                                diceRollController.changeShowNumber(),
                                diceRollController.updateCounter()
                              });
                        },
                        text: 'Roll'),
                  ],
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
