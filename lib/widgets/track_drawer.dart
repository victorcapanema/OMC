import 'package:flutter/material.dart';
import '../shared/app_colors.dart';
import '../shared/constants.dart';

class TrackDrawer extends StatelessWidget {
  const TrackDrawer({this.paddingTop = 0, super.key});

  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - paddingTop;
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage("images/greyBackground.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: height / 3, crossAxisCount: 2),
          itemCount: globalNumPlayers,
          itemBuilder: (BuildContext context, int i) {
            int auxLifeCount = globalLifePoints;
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 26, 8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listCounters[i].lifeCounterController.player.playerName,
                      style: const TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    const Row(
                      children: [
                        Text('Add', style: TextStyle(color: AppColors.grey)),
                        Spacer(),
                        Text('New Total', style: TextStyle(color: AppColors.grey))
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listCounters[i].lifeCounterController.counterHistory.length,
                      itemBuilder: (BuildContext context, int x) {
                        auxLifeCount = auxLifeCount + listCounters[i].lifeCounterController.counterHistory[x];
                        return Row(
                          children: [
                            Text(
                              listCounters[i].lifeCounterController.counterHistory[x] > 0
                                  ? '+${listCounters[i].lifeCounterController.counterHistory[x].toString()}'
                                  : listCounters[i].lifeCounterController.counterHistory[x].toString(),
                              style: const TextStyle(color: AppColors.grey, fontSize: 20),
                            ),
                            const Spacer(),
                            Text(
                              auxLifeCount.toString(),
                              style: const TextStyle(color: AppColors.grey, fontSize: 20),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
