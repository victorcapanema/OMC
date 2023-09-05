import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import '../../../models/player_model.dart';
import '../../../shared/app_colors.dart';
import '../../../shared/app_text_styles.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/modal_screen.dart';
import '../../card_search/view/card_search_page.dart';
import '../../color_picker/view/color_picker_page.dart';
import '../controller/player_edit_page_controller.dart';

class PlayerEditPage extends StatefulWidget {
  const PlayerEditPage({required this.player, Key? key}) : super(key: key);
  final PlayerModel player;

  @override
  State<PlayerEditPage> createState() => _PlayerEditPageState();
}

class _PlayerEditPageState extends State<PlayerEditPage> {
  final playerEditPageController = Modular.get<PlayerEditPageController>();

  @override
  void initState() {
    super.initState();
    playerEditPageController.initialState(widget.player);
  }

  @override
  Widget build(BuildContext context) {
    SnackBar showSnackBar(String text) {
      return SnackBar(
        content: Text(text),
        duration: const Duration(milliseconds: 1000),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        Modular.to.pop(playerEditPageController.playerModel);
        return true;
      },
      child: ModalPage(
        onTap: () {
          Modular.to.pop(playerEditPageController.playerModel);
        },
        child: Observer(
          builder: (_) => SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Center(
                            child: Text(
                          'PLAYER PREFERENCES',
                          style: TextStyle(color: AppColors.grey),
                        )),
                      ),
                      Positioned(
                        top: 6,
                        right: 6,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.close, color: AppColors.grey),
                          onPressed: () {
                            Modular.to.pop(playerEditPageController.playerModel);
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: CTextFormField(
                          name: 'Player',
                          controller: playerEditPageController.playerNameController,
                          onChanged: (String value) {
                            playerEditPageController.playerModel.playerName = value;
                          },
                        )),
                        IconButton(
                            onPressed: () {
                              playerEditPageController.savePlayer();
                              ScaffoldMessenger.of(context).showSnackBar(showSnackBar('Profile saved!'));
                            },
                            icon: const Icon(Icons.save, color: AppColors.grey),
                            tooltip: 'Save perfil'),
                        IconButton(
                            onPressed: () {
                              playerEditPageController.newPlayer();
                            },
                            icon: const Icon(Icons.add, color: AppColors.grey),
                            tooltip: 'New perfil'),
                        IconButton(
                            onPressed: () {
                              Modular.to
                                  .pushNamed('/profilePage', arguments: playerEditPageController.playerModel.id)
                                  .then((value) => {
                                        if (value != null)
                                          {playerEditPageController.changePlayer(value as PlayerModel)}
                                        else
                                          {playerEditPageController.findProfile()}
                                      });
                            },
                            icon: const Icon(Icons.refresh, color: AppColors.grey),
                            tooltip: 'Load perfil')
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text('BACKGROUND', style: TextStyle(color: AppColors.grey)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Modular.to
                                    .push(PageRouteBuilder(
                                        opaque: false,
                                        pageBuilder: (_, __, ___) =>
                                            CardPage(cardSelected: playerEditPageController.selectedCard)))
                                    .then((value) => {
                                          if (value != null && value != 'unselect')
                                            {playerEditPageController.changeSelectedCard(value)}
                                          else if (value != null && value == 'unselect')
                                            {playerEditPageController.unselectCard()},
                                        });
                              },
                              child: Ink(
                                child: Stack(children: [
                                  Positioned(
                                    bottom: 25,
                                    left: -5,
                                    child: SvgPicture.asset(
                                        height: 90,
                                        "images/lotus.svg",
                                        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn)),
                                  ),
                                  Container(
                                    height: 130,
                                    width: 150,
                                    decoration: playerEditPageController.image != ''
                                        ? BoxDecoration(
                                            border: Border.all(),
                                            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                            image: DecorationImage(
                                                fit: BoxFit.fill, image: NetworkImage(playerEditPageController.image)))
                                        : BoxDecoration(
                                            border: Border.all(),
                                            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                          ),
                                  )
                                ]),
                              ),
                            ),
                            const Text('Card', style: TextStyle(color: AppColors.grey))
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Modular.to
                                    .push(PageRouteBuilder(
                                        opaque: false,
                                        pageBuilder: (_, __, ___) => ColorPickerPage(
                                            colorPicked: playerEditPageController.playerModel.selectedColor)))
                                    .then((value) => {
                                          if (value != null) {playerEditPageController.changeSelectedColor(value)},
                                        });
                              },
                              child: Ink(
                                child: Container(
                                  height: 130,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                    color: playerEditPageController.selectedColor,
                                  ),
                                ),
                              ),
                            ),
                            const Text('Color', style: TextStyle(color: AppColors.grey))
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 26),
                  const Text('TEXT SETTINGS', style: TextStyle(color: AppColors.grey)),
                  const SizedBox(height: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 6),
                      Container(
                          height: 80,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: playerEditPageController.pLayerTextPreferences.textColor == '2'
                                  ? Colors.brown
                                  : Colors.grey),
                          child: Row(
                            children: [
                              const SizedBox(width: 8),
                              Text(
                                '-',
                                style: TextStyles.textStyleSelector(
                                    playerEditPageController.pLayerTextPreferences.textColor,
                                    playerEditPageController.pLayerTextPreferences.contrastValue,
                                    playerEditPageController.pLayerTextPreferences.fontSizeIcons),
                              ),
                              const Spacer(),
                              Text(
                                '8',
                                style: TextStyles.textStyleSelector(
                                    playerEditPageController.pLayerTextPreferences.textColor,
                                    playerEditPageController.pLayerTextPreferences.contrastValue,
                                    playerEditPageController.pLayerTextPreferences.fontSizeLife),
                              ),
                              const Spacer(),
                              Text(
                                '+',
                                style: TextStyles.textStyleSelector(
                                    playerEditPageController.pLayerTextPreferences.textColor,
                                    playerEditPageController.pLayerTextPreferences.contrastValue,
                                    playerEditPageController.pLayerTextPreferences.fontSizeIcons),
                              ),
                              const SizedBox(width: 8),
                            ],
                          )),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              activeColor: AppColors.grey,
                              title: const Text("Black", style: TextStyle(color: AppColors.grey)),
                              value: "2",
                              groupValue: playerEditPageController.pLayerTextPreferences.textColor,
                              onChanged: (value) {
                                playerEditPageController.changeSelectedTextColor(value.toString());
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              activeColor: AppColors.grey,
                              title: const Text("White", style: TextStyle(color: AppColors.grey)),
                              value: "1",
                              groupValue: playerEditPageController.pLayerTextPreferences.textColor,
                              onChanged: (value) {
                                playerEditPageController.changeSelectedTextColor(value.toString());
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text('CONTRAST LEVEL', style: TextStyle(color: AppColors.grey)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Slider(
                            activeColor: AppColors.grey,
                            value: playerEditPageController.pLayerTextPreferences.contrastValue,
                            max: 20,
                            divisions: 20,
                            label: playerEditPageController.pLayerTextPreferences.contrastValue.round().toString(),
                            onChanged: playerEditPageController.changeContrastValue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('FONT SIZE (life)', style: TextStyle(color: AppColors.grey)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 6),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Slider(
                            activeColor: AppColors.grey,
                            value: playerEditPageController.pLayerTextPreferences.fontSizeLife,
                            max: 80,
                            min: 10,
                            divisions: 60,
                            label: playerEditPageController.pLayerTextPreferences.fontSizeLife.round().toString(),
                            onChanged: playerEditPageController.changeFontSizeLife),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('FONT SIZE (- +)', style: TextStyle(color: AppColors.grey)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 6),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Slider(
                            activeColor: AppColors.grey,
                            value: playerEditPageController.pLayerTextPreferences.fontSizeIcons,
                            max: 80,
                            min: 10,
                            divisions: 60,
                            label: playerEditPageController.pLayerTextPreferences.fontSizeIcons.round().toString(),
                            onChanged: playerEditPageController.changeFontSizeIcons),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
