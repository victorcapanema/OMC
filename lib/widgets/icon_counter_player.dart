import 'package:flutter/material.dart';
import 'package:life_counter/models/player_model.dart';
import 'custom_svg.dart';

class PlayerIconCounter extends StatelessWidget {
  const PlayerIconCounter(
      {required this.index,
      required this.count,
      required this.player,
      required this.addFunction,
      required this.subFunction,
      super.key});

  final int index;
  final int count;
  final PlayerModel player;
  final void Function(int) addFunction;
  final void Function(int) subFunction;

  @override
  Widget build(BuildContext context) {
    Color auxColor = player.pLayerTextPreferences.textColor == '1' ? Colors.white : Colors.black;
    return Container(
      color: player.backgroundType == 1 ? Colors.transparent : Colors.white,
      child: Container(
          decoration: player.backgroundType == 1
              ? BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                  ),
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(player.selectedCard!.imageUris!.artCrop!),
                  ),
                )
              : BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                  ),
                  color: player.selectedColor?.withOpacity(1)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 2),
                    InkWell(
                      onTap: () {
                        addFunction(index);
                      },
                      child: CSvg("images/ability-raid.svg", color: auxColor),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: InkWell(
                          onTap: () {
                            subFunction(index);
                          },
                          child: Ink(
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [Icon(Icons.remove, color: auxColor)],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(count.toString(), style: TextStyle(color: auxColor)),
              FittedBox(fit: BoxFit.fitWidth, child: Text(player.playerName, style: TextStyle(color: auxColor)))
            ],
          )),
    );
  }
}
