import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:life_counter/shared/app_colors.dart';
import '../funcionalities/home/controller/counter_layout_controller.dart';
import 'custom_buttom.dart';

class CDrawer extends StatelessWidget {
  const CDrawer({required this.counterLayoutController, super.key});

  final CounterLayoutController counterLayoutController;

  @override
  Widget build(BuildContext context) {
    List<int> lifeTotals = [20, 30, 40, 60];

    return Observer(
      builder: (_) => Drawer(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage("images/greyBackground.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: AppColors.darkGrey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Counter Settings',
                      style: TextStyle(fontSize: 30, color: AppColors.grey),
                    ),
                    CustomButton(
                      backgroundColor: AppColors.grey,
                      textColor: AppColors.black2,
                      text: 'About',
                      onPressed: () {
                        Modular.to.pushNamed('/aboutPage');
                      },
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'NUMBER OF PLAYERS',
                      style: TextStyle(color: AppColors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        for (var i = 1; i <= 6; i++)
                          CustomButton(
                              text: i.toString(),
                              width: 40,
                              height: 40,
                              textPadding: false,
                              onPressed: () {
                                counterLayoutController.changeNumPlayers(i);
                              },
                              backgroundColor:
                                  i == counterLayoutController.nPlayers
                                      ? AppColors.darkGrey
                                      : Colors.transparent),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'STARTING LIFE TOTAL',
                      style: TextStyle(color: AppColors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        for (var i = 0; i < 4; i++)
                          i < 3
                              ? CustomButton(
                                  text: lifeTotals[i].toString(),
                                  height: 50,
                                  width: 50,
                              textPadding: false,
                                  onPressed: () {
                                    counterLayoutController
                                        .changeStartingLifeTotal(int.parse(
                                            lifeTotals[i].toString()));
                                    counterLayoutController
                                        .changeLifeTotalSelected(i);
                                  },
                                  backgroundColor: i ==
                                          counterLayoutController.lifeTotalIndex
                                      ? AppColors.darkGrey
                                      : Colors.transparent)
                              : Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, // the thickness
                                        color: AppColors.lightGrey),
                                    color: counterLayoutController
                                                .customLifeController
                                                .text
                                                .isNotEmpty &&
                                            i ==
                                                counterLayoutController
                                                    .lifeTotalIndex
                                        ? AppColors.darkGrey
                                        : Colors.black.withOpacity(0.35),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: TextFormField(
                                    controller: counterLayoutController
                                        .customLifeController,
                                    onEditingComplete: () {
                                      counterLayoutController
                                          .changeStartingLifeTotal(int.parse(
                                              counterLayoutController
                                                  .customLifeController.text));
                                      counterLayoutController
                                          .changeLifeTotalSelected(i);
                                    },
                                    onFieldSubmitted: (text) {
                                      counterLayoutController
                                          .changeStartingLifeTotal(int.parse(
                                              counterLayoutController
                                                  .customLifeController.text));
                                      counterLayoutController
                                          .changeLifeTotalSelected(i);
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                                )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'RESET',
                      style: TextStyle(color: AppColors.grey),
                    ),
                    Wrap(
                      children: [
                        CustomButton(
                            text: 'Life Points',
                            onPressed:
                                counterLayoutController.resetPLayersLifeTotal),
                        CustomButton(
                            text: 'Background',
                            onPressed:
                                counterLayoutController.resetPLayersBackground),
                        CustomButton(
                            text: 'Counters',
                            onPressed:
                                counterLayoutController.resetPLayersCounters),
                        CustomButton(
                            text: 'All',
                            onPressed: counterLayoutController.resetAllPlayers),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'FUNCTIONS',
                      style: TextStyle(color: AppColors.grey),
                    ),
                    Wrap(
                      children: [
                        CustomButton(
                            text: counterLayoutController.isSearch
                                ? 'Random Card BG'
                                : 'Cooldown ${counterLayoutController.timerCount}',
                            onPressed: counterLayoutController.isSearch
                                ? counterLayoutController.randomBackground
                                : null),
                        CustomButton(
                            text: 'Random Color BG',
                            onPressed:
                                counterLayoutController.randomColorBackground),
                        CustomButton(
                            text: 'Gatherer',
                            onPressed: () {
                              Modular.to.pop(context);
                              Modular.to
                                  .pushNamed('/cardPage', arguments: true);
                            }),
                        CustomButton(
                            text: 'Storm & Mana',
                            onPressed: () {
                              Modular.to.pop(context);
                              Modular.to.pushNamed('/stormPage');
                            }),
                        CustomButton(
                            text: 'Dices',
                            onPressed: () {
                              Modular.to.pop(context);
                              Modular.to.pushNamed('/dicePage');
                            })
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LAYOUT',
                        style: TextStyle(color: AppColors.grey),
                      ),
                      Wrap(children: [
                        CustomButton(
                            text: 'Hide P. Name',
                            onPressed: () {
                              counterLayoutController.changeNameStatus();
                            }),
                        CustomButton(
                            text: 'B/W Font',
                            onPressed: () {
                              counterLayoutController.changePlayersFontColors();
                            }),
                      ]),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
