import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/app_text_styles.dart';
import '../../../shared/constants.dart';
import '../../../shared/functions/get_aspec_ratio.dart';
import '../../../shared/functions/get_touch_size.dart';
import '../../../widgets/icon_counter.dart';
import '../../../widgets/icon_counter_player.dart';
import '../../../widgets/widget_selector.dart';
import '../../player_edit/view/player_edit_page.dart';
import '../controller/life_counter_controller.dart';

class LifeCounterPage extends StatefulWidget {
  const LifeCounterPage({required this.lifeCounterController, required this.id, Key? key}) : super(key: key);
  final LifeCounterController lifeCounterController;
  final int id;

  @override
  State<LifeCounterPage> createState() => _LifeCounterPageState();
}

class _LifeCounterPageState extends State<LifeCounterPage> {

  @override
  void initState() {
    widget.lifeCounterController.initState(widget.id);
    super.initState();
  }

  Material cInkWell(BuildContext context, bool isAdd) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTapDown: (_) => widget.lifeCounterController.updateCounter(isAdd),
        onTapUp: (_) => widget.lifeCounterController.cancelTimer(isAdd),
        onTapCancel: () => widget.lifeCounterController.cancelTimer(isAdd),
        child: Ink(
          width: getTouchSize(widget.id, MediaQuery.of(context).size.height, MediaQuery.of(context).size.width, 2),
          height: getTouchSize(widget.id, MediaQuery.of(context).size.height, MediaQuery.of(context).size.width, 1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool auxCont = false;
    AppBar appBar = AppBar();
    double appBarSize = appBar.preferredSize.height;

    return Scaffold(
      body: Observer(
        builder: (_) => WidgetSelector(
          state: widget.lifeCounterController.loadState,
          widget: Container(
            decoration: widget.lifeCounterController.player.backgroundType == 1
                ? BoxDecoration(
                    border: Border.all(
                      width: 3.0,
                    ),
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage((widget.lifeCounterController.player.selectedCard != null &&
                              widget.lifeCounterController.player.selectedCard!.imageUris!.artCrop != null)
                          ? widget.lifeCounterController.player.selectedCard!.imageUris!.artCrop!
                          : 'https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png'),
                    ),
                  )
                : BoxDecoration(
                    border: Border.all(
                      width: 3.0,
                    ),
                    color: widget.lifeCounterController.player.selectedColor),
            width: MediaQuery.of(context).size.width + appBarSize,
            child: CarouselSlider(
              items: [
                Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.lifeCounterController.lifeDifference.toString(),
                            style: TextStyle(
                                color: widget.lifeCounterController.lifeDifference != 0
                                    ? widget.lifeCounterController.player.pLayerTextPreferences.textColor == '1'
                                        ? Colors.white
                                        : Colors.black
                                    : Colors.transparent),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  '-',
                                  style: TextStyles.textStyleSelector(
                                      widget.lifeCounterController.player.pLayerTextPreferences.textColor,
                                      widget.lifeCounterController.player.pLayerTextPreferences.contrastValue,
                                      widget.lifeCounterController.player.pLayerTextPreferences.fontSizeIcons),
                                ),
                                const Spacer(),
                                const SizedBox(width: 16),
                                Text(
                                  widget.lifeCounterController.currentLife.toString(),
                                  style: TextStyles.textStyleSelector(
                                      widget.lifeCounterController.player.pLayerTextPreferences.textColor,
                                      widget.lifeCounterController.player.pLayerTextPreferences.contrastValue,
                                      widget.lifeCounterController.player.pLayerTextPreferences.fontSizeLife),
                                ),
                                const Spacer(),
                                Text(
                                  '+',
                                  style: TextStyles.textStyleSelector(
                                      widget.lifeCounterController.player.pLayerTextPreferences.textColor,
                                      widget.lifeCounterController.player.pLayerTextPreferences.contrastValue,
                                      widget.lifeCounterController.player.pLayerTextPreferences.fontSizeIcons),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    cInkWell(context, false),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: cInkWell(context, true),
                    ),
                    Visibility(
                      visible: widget.lifeCounterController.showName,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                  ),
                                ),
                                onPressed: () {
                                  Modular.to
                                      .push(PageRouteBuilder(
                                          opaque: false,
                                          pageBuilder: (_, __, ___) =>
                                              PlayerEditPage(player: widget.lifeCounterController.player)))
                                      .then((value) => {
                                            widget.lifeCounterController.changePlayer(value),
                                            widget.lifeCounterController.refreshAll()
                                          });
                                },
                                child: Text(
                                  widget.lifeCounterController.player.playerName != ''
                                      ? widget.lifeCounterController.player.playerName
                                      : 'Player Name',
                                  style: TextStyles.textStyleSelector(
                                      widget.lifeCounterController.player.pLayerTextPreferences.textColor,
                                      widget.lifeCounterController.player.pLayerTextPreferences.contrastValue,
                                      18),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,5,5,2),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 8, mainAxisSpacing: 4, crossAxisCount: 4),
                        itemCount: widget.lifeCounterController.iconCounters.length,
                        itemBuilder: (BuildContext context, int i) {
                          return IconCounter(
                              index: i,
                              counterIcon: widget.lifeCounterController.iconCounters[i],
                              addFunction: widget.lifeCounterController.addCount,
                              subFunction: widget.lifeCounterController.subCount,
                              colorSelected: widget.lifeCounterController.player.pLayerTextPreferences.textColor);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 8, mainAxisSpacing: 4, crossAxisCount: 4),
                        itemCount: globalNumPlayers - 1,
                        itemBuilder: (BuildContext context, int i) {
                          if (i == 0) {
                            auxCont = false;
                          }
                          if (widget.id == (i + 1)) {
                            auxCont = true;
                          }
                          return PlayerIconCounter(
                              player: listCounters[auxCont & ((i + 1) < listCounters.length) ? i + 1 : i]
                                  .lifeCounterController
                                  .player,
                              count: widget.lifeCounterController
                                  .playersCounters[auxCont & ((i + 1) < listCounters.length) ? i + 1 : i],
                              index: auxCont & ((i + 1) < listCounters.length) ? i + 1 : i,
                              addFunction: widget.lifeCounterController.addPlayerCount,
                              subFunction: widget.lifeCounterController.subPlayerCount);
                        },
                      ),
                    ),
                  ],
                ),
              ],
              options: CarouselOptions(
                aspectRatio:
                    getAspectRatio(widget.id, MediaQuery.of(context).size.height, MediaQuery.of(context).size.width),
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
                viewportFraction: 1,
                enlargeFactor: 0,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
