import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:life_counter/shared/constants.dart';
import 'package:life_counter/widgets/custom_buttom.dart';
import 'package:life_counter/widgets/modal_screen.dart';
import '../../../shared/app_colors.dart';
import '../../../widgets/custom_delete_dialog.dart';
import '../../../widgets/player_profile_tile.dart';
import '../controller/player_profile_controller.dart';

class PlayerProfilePage extends StatefulWidget {
  const PlayerProfilePage({super.key});

  @override
  State<PlayerProfilePage> createState() => _PlayerProfilePageState();
}

class _PlayerProfilePageState extends State<PlayerProfilePage> {
  final playerProfilePageController = Modular.get<PlayerProfilePageController>();

  @override
  void initState() {
    super.initState();
    playerProfilePageController.initialState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalPage(
        child: Observer(
            builder: (_) => Container(
                  constraints: const BoxConstraints(minHeight: 500, minWidth: double.infinity),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 4),
                        const Text('PLAYER PROFILE', style: TextStyle(color: AppColors.grey)),
                        IconButton(
                          onPressed: () {
                            playerProfilePageController.changeShowTip();
                          },
                          icon: const Icon(
                            Icons.tips_and_updates,
                            color: AppColors.grey,
                          ),
                        ),
                        Visibility(
                          visible: playerProfilePageController.showTip,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Container(
                              decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.grey)),
                              child: const Text(
                                  textAlign: TextAlign.center,
                                  'Tap on the background to choose which one to load with, and press the load button.',
                                  style: TextStyle(color: AppColors.grey)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              buttonColor: Colors.redAccent,
                              onPressed: () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CDeleteAlertDialog(functionDeleteVoid: playerProfilePageController.deleteAll));
                              },
                              text: 'Delete All',
                            ),
                            const SizedBox(width: 50),
                            CustomButton(
                              backgroundColor: AppColors.grey,
                              textColor: AppColors.black,
                              onPressed: () {
                                Modular.to.pop();
                              },
                              text: 'Back',
                            ),
                          ],
                        ),
                        Visibility(
                          visible: playerProfilePageController.loadState == LoadState.success,
                          child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: playerProfilePageController.listPlayerProfiles.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(40, 8, 40, 0),
                                child: PlayerProfileTile(
                                  id: i,
                                  playerProfilePageController: playerProfilePageController,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        Visibility(
                          visible: playerProfilePageController.listPlayerProfiles.isNotEmpty,
                          child: const Center(
                              child: Text('All card images © Wizards of the Coast.',
                                  style: TextStyle(color: AppColors.grey, fontSize: 15))),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                )));
  }
}
