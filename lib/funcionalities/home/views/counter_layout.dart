import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/constants.dart';
import '../../../widgets/custom_drawer.dart';
import '../../../widgets/track_drawer.dart';
import '../controller/counter_layout_controller.dart';

class CounterLayout extends StatefulWidget {
  const CounterLayout({Key? key}) : super(key: key);

  @override
  State<CounterLayout> createState() => _CounterLayoutState();
}

class _CounterLayoutState extends State<CounterLayout>
    with TickerProviderStateMixin {
  final counterLayoutController = Modular.get<CounterLayoutController>();

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    double paddingBottom = MediaQuery.of(context).padding.bottom;
    var height =
        MediaQuery.of(context).size.height - (paddingTop + paddingBottom);
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Observer(
        builder: (_) => Scaffold(
          drawer: CDrawer(counterLayoutController: counterLayoutController),
          endDrawer: TrackDrawer(paddingTop: paddingTop),
          body: SizedBox(
            height: height,
            width: width,
            child: layoutSelector(
                counterLayoutController.nPlayers, height, width, listCounters),
          ),
        ),
      ),
    );
  }
}

Widget layoutSelector(int nPlayers, height, width, listCounters) {
  bool isEven = nPlayers % 2 == 0;
  if (isEven) {
    if (nPlayers == 2) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: width / (height / 2), crossAxisCount: 1),
        itemCount: nPlayers,
        itemBuilder: (BuildContext context, int i) {
          return RotatedBox(
              quarterTurns: i % 2 == 0 ? 2 : 0, child: listCounters[1 - i]);
        },
      );
    } else {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (width / 2) / (height / (nPlayers / 2)),
            crossAxisCount: 2),
        itemCount: nPlayers,
        itemBuilder: (BuildContext context, int i) {
          return RotatedBox(
              quarterTurns: i % 2 == 0 ? 1 : 3, child: listCounters[i]);
        },
      );
    }
  } else {
    if (nPlayers == 1) {
      return Stack(children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage("images/greyBackground.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width,
              height: height / 2,
              child: listCounters[globalNumPlayers - 1],
            ),
          ],
        ),
      ]);
    } else {
      return CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (width / 2) / (height / ((nPlayers + 1) / 2)),
                crossAxisCount: 2),
            delegate: SliverChildBuilderDelegate(
                childCount: nPlayers - 1,
                (context, i) => RotatedBox(
                    quarterTurns: i % 2 == 0 ? 1 : 3, child: listCounters[i])),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: width,
              height: (height / ((nPlayers + 1) / 2)),
              child: RotatedBox(
                  quarterTurns: 0, child: listCounters[globalNumPlayers - 1]),
            ),
          ),
        ],
      );
    }
  }
}
