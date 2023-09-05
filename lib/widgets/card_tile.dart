import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../models/card_model.dart';
import '../shared/app_colors.dart';
import 'custom_circular_progress.dart';

class CardTile extends StatelessWidget {
  const CardTile({required this.card, this.isSelected = false, this.isGatherer = false, Key? key}) : super(key: key);
  final CardModel card;
  final bool isSelected;
  final bool isGatherer;

  @override
  Widget build(BuildContext context) {
    double sizeW = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Modular.to.pushNamed('/gathererPage', arguments: card);
      },
      child: Ink(
        color: isSelected ? Colors.grey.withOpacity(0.5) : Colors.transparent,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: card.imageUris?.small ??
                  'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
              height: sizeW * 0.35,
              width: sizeW * 0.35,
              progressIndicatorBuilder: (context, url, downloadProgress) => const Padding(
                padding: EdgeInsets.all(50),
                child: CCircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(card.name ?? '', style: const TextStyle(color: AppColors.grey), textAlign: TextAlign.center),
                  const SizedBox(height: 4),
                  Text('Set: ${card.setName}',
                      style: const TextStyle(color: AppColors.grey), textAlign: TextAlign.center),
                  const SizedBox(height: 4),
                  Text('Artist: ${card.artist}',
                      style: const TextStyle(color: AppColors.grey), textAlign: TextAlign.center),
                  const SizedBox(height: 4),
                  const Text('© Wizards of the Coast',
                      style: TextStyle(color: AppColors.grey), textAlign: TextAlign.center),
                  const SizedBox(height: 4),
                  isGatherer
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.darkGrey,
                              side: const BorderSide(
                                  width: 2, // the thickness
                                  color: AppColors.lightGrey // the color of the border
                                  )),
                          onPressed: () {
                            Modular.to.pushNamed('/gathererPage', arguments: card);
                          },
                          child: const Text('Gatherer'))
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.darkGrey,
                              side: const BorderSide(
                                  width: 2, // the thickness
                                  color: AppColors.lightGrey // the color of the border
                                  )),
                          onPressed: isSelected
                              ? () {
                                  Navigator.pop(context, 'unselect');
                                }
                              : () {
                                  Navigator.pop(context, card);
                                },
                          child: Text(isSelected ? 'Remove Background' : 'Set Background')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
