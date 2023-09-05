import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../shared/app_colors.dart';

class ModalPage extends StatelessWidget {
  const ModalPage(
      {required this.child,
      this.padding = const EdgeInsets.fromLTRB(15, 40, 15, 30),
      this.isCenter = false,
      this.onTap,
      super.key});

  final Widget child;
  final EdgeInsets padding;
  final bool isCenter;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.4),
        body: Stack(
          children: [
            GestureDetector(
              onTap: onTap ??
                  () {
                    Modular.to.pop();
                  },
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(color: Colors.transparent),
              ),
            ),
            Padding(
              padding: padding,
              child: Align(
                alignment: isCenter ? Alignment.center : Alignment.topCenter,
                child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.iceWhite,
                      image: DecorationImage(
                        image: AssetImage("images/greyBackground.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: child),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
