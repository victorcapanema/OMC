import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../funcionalities/player_profiles/controller/player_profile_controller.dart';
import '../shared/app_colors.dart';
import 'custom_delete_dialog.dart';

class PlayerProfileTile extends StatefulWidget {
  const PlayerProfileTile({required this.id, required this.playerProfilePageController, super.key});

  final int id;
  final PlayerProfilePageController playerProfilePageController;

  @override
  State<PlayerProfileTile> createState() => _PlayerProfileTileState();
}

class _PlayerProfileTileState extends State<PlayerProfileTile> {
  final listaAux = [Colors.yellow, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Container(
              decoration: BoxDecoration(border: Border.all(width: 2, color: AppColors.grey)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.playerProfilePageController.listPlayerProfiles[widget.id].playerName,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text('Cards', style: TextStyle(color: Colors.grey)),
                          SizedBox(
                            height: 80,
                            width: 150,
                            child: CarouselSlider(
                              items: [
                                for (var i in widget
                                    .playerProfilePageController.listPlayerProfiles[widget.id].backgroundCards!)
                                  Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Column(
                                        children: [
                                          Flexible(
                                            child: GestureDetector(
                                              onTap: () {
                                                widget.playerProfilePageController.changeSelectedCard(
                                                    widget.playerProfilePageController.listPlayerProfiles[widget.id].id,
                                                    i);
                                              },
                                              child: Container(
                                                decoration: widget.playerProfilePageController
                                                        .listPlayerProfiles[widget.id].backgroundCards!.isNotEmpty
                                                    ? BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(i.imageUris!.artCrop!)))
                                                    : const BoxDecoration(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Text('Artist: ${i.artist!}',
                                              style: const TextStyle(fontSize: 10, color: Colors.grey))
                                        ],
                                      ))
                              ],
                              options: CarouselOptions(
                                enableInfiniteScroll: true,
                                enlargeCenterPage: false,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          const Text('Colors', style: TextStyle(color: Colors.grey)),
                          SizedBox(
                            height: 60,
                            width: 120,
                            child: CarouselSlider(
                              items: [
                                for (var i in widget
                                        .playerProfilePageController.listPlayerProfiles[widget.id].backgroundColors ??
                                    listaAux)
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: GestureDetector(
                                        onTap: () {
                                          widget.playerProfilePageController.changeSelectedColor(
                                              widget.playerProfilePageController.listPlayerProfiles[widget.id].id, i);
                                        },
                                        child: Container(decoration: BoxDecoration(border: Border.all(), color: i))),
                                  )
                              ],
                              options: CarouselOptions(
                                // aspectRatio: ,
                                enableInfiniteScroll: true,
                                enlargeCenterPage: false,
                                //viewportFraction: 1,
                                // enlargeFactor: 0,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Background:', style: TextStyle(color: Colors.grey)),
                      const SizedBox(width: 4),
                      widget.playerProfilePageController.listPlayerProfiles[widget.id].backgroundType == 1
                          ? Expanded(
                              child: Text(
                                  widget.playerProfilePageController.listPlayerProfiles[widget.id].selectedCard!.name!,
                                  style: const TextStyle(color: Colors.grey)),
                            )
                          : Icon(
                              Icons.circle_rounded,
                              color: widget.playerProfilePageController.listPlayerProfiles[widget.id].selectedColor,
                            ),
                      IconButton(
                          onPressed: () {
                            Modular.to.pop(widget.playerProfilePageController.listPlayerProfiles[widget.id]);
                          },
                          icon: const Icon(
                            Icons.rotate_right,
                            color: AppColors.grey,
                          )),
                      IconButton(
                          onPressed: () {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => CDeleteAlertDialog(
                                    id: widget.playerProfilePageController.listPlayerProfiles[widget.id].id,
                                    functionDeleteString: widget.playerProfilePageController.deleteProfile));
                          },
                          icon: const Icon(
                            Icons.delete_outline_rounded,
                            color: AppColors.grey,
                          ))
                    ],
                  ),
                ],
              ),
            ));
  }
}
