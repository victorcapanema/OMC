import 'package:flutter/material.dart';
import '../shared/app_colors.dart';
import '../shared/classes.dart';
import 'custom_svg.dart';

class IconCounter extends StatelessWidget {
  const IconCounter(
      {required this.index,
      required this.counterIcon,
      required this.addFunction,
      required this.subFunction,
      required this.colorSelected,
      super.key});

  final int index;
  final CounterIcon counterIcon;
  final String colorSelected;
  final void Function(int) addFunction;
  final void Function(int) subFunction;

  @override
  Widget build(BuildContext context) {
    Color auxColor = colorSelected == '1' ? Colors.white : Colors.black;
    return Container(
        decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.5),
          border: Border.all(
            width: 1.0,
            color: AppColors.black2,
          ),
        ),
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
                    child: CSvg(counterIcon.iconPath, height: 35, color: auxColor),
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
            Text(counterIcon.count.toString(), style: TextStyle(color: auxColor)),
            FittedBox(fit: BoxFit.fitWidth, child: Text(counterIcon.name, style: TextStyle(color: auxColor)))
          ],
        ));
  }
}
